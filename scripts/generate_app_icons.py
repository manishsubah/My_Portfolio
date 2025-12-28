#!/usr/bin/env python3
"""
App Icon Generator
==================

This script generates all required app icon sizes for Android and iOS
from a source profile image.

Requirements:
    pip install Pillow

Usage:
    python scripts/generate_app_icons.py [source_image_path]

If no source image is provided, it defaults to 'assets/icons/profile.jpg'
"""

import os
import sys
from pathlib import Path
from PIL import Image, ImageDraw, ImageFilter

# Color constants
BACKGROUND_COLOR = (255, 255, 255)  # White background for icons
ACCENT_COLOR = (0, 102, 255)  # Flutter Blue
GRADIENT_START = (0, 102, 255)  # Flutter Blue
GRADIENT_END = (0, 210, 127)  # Android Green

# Icon style settings
USE_ROUNDED_SQUARE = False  # Set to True for rounded square instead of circle
PADDING_PERCENT = 0.05  # 5% padding (reduced from 10% for better visibility)

# Android icon sizes (in pixels)
ANDROID_SIZES = {
    'mipmap-mdpi': 48,
    'mipmap-hdpi': 72,
    'mipmap-xhdpi': 96,
    'mipmap-xxhdpi': 144,
    'mipmap-xxxhdpi': 192,
}

# iOS icon sizes (base size * scale factor)
IOS_SIZES = [
    # iPhone icons
    {'size': 20, 'scale': 2, 'filename': 'Icon-App-20x20@2x.png'},  # 40x40
    {'size': 20, 'scale': 3, 'filename': 'Icon-App-20x20@3x.png'},  # 60x60
    {'size': 29, 'scale': 1, 'filename': 'Icon-App-29x29@1x.png'},  # 29x29
    {'size': 29, 'scale': 2, 'filename': 'Icon-App-29x29@2x.png'},  # 58x58
    {'size': 29, 'scale': 3, 'filename': 'Icon-App-29x29@3x.png'},  # 87x87
    {'size': 40, 'scale': 2, 'filename': 'Icon-App-40x40@2x.png'},  # 80x80
    {'size': 40, 'scale': 3, 'filename': 'Icon-App-40x40@3x.png'},  # 120x120
    {'size': 60, 'scale': 2, 'filename': 'Icon-App-60x60@2x.png'},  # 120x120
    {'size': 60, 'scale': 3, 'filename': 'Icon-App-60x60@3x.png'},  # 180x180
    # iPad icons
    {'size': 20, 'scale': 1, 'filename': 'Icon-App-20x20@1x.png'},  # 20x20
    {'size': 20, 'scale': 2, 'filename': 'Icon-App-20x20@2x.png'},  # 40x40 (iPad)
    {'size': 29, 'scale': 1, 'filename': 'Icon-App-29x29@1x.png'},  # 29x29 (iPad)
    {'size': 29, 'scale': 2, 'filename': 'Icon-App-29x29@2x.png'},  # 58x58 (iPad)
    {'size': 40, 'scale': 1, 'filename': 'Icon-App-40x40@1x.png'},  # 40x40
    {'size': 40, 'scale': 2, 'filename': 'Icon-App-40x40@2x.png'},  # 80x80 (iPad)
    {'size': 76, 'scale': 1, 'filename': 'Icon-App-76x76@1x.png'},  # 76x76
    {'size': 76, 'scale': 2, 'filename': 'Icon-App-76x76@2x.png'},  # 152x152
    {'size': 83.5, 'scale': 2, 'filename': 'Icon-App-83.5x83.5@2x.png'},  # 167x167
    # App Store
    {'size': 1024, 'scale': 1, 'filename': 'Icon-App-1024x1024@1x.png'},  # 1024x1024
]


def smart_crop_center(image: Image.Image, target_size: int) -> Image.Image:
    """
    Smart crop to center, focusing on the face/center of the image.
    
    Args:
        image: Source PIL Image
        target_size: Target square size
    
    Returns:
        Cropped and resized square image
    """
    width, height = image.size
    
    # Calculate crop box (center crop)
    if width > height:
        # Landscape: crop width
        left = (width - height) // 2
        top = 0
        right = left + height
        bottom = height
    else:
        # Portrait: crop height
        left = 0
        top = (height - width) // 2
        right = width
        bottom = top + width
    
    # Crop to square
    cropped = image.crop((left, top, right, bottom))
    
    # Resize to target size with high quality
    resized = cropped.resize((target_size, target_size), Image.Resampling.LANCZOS)
    
    return resized


def create_icon_with_background(image: Image.Image, size: int, use_rounded_square: bool = False) -> Image.Image:
    """
    Create a professional app icon with background.
    
    Args:
        image: Source PIL Image
        size: Target size in pixels
        use_rounded_square: Use rounded square instead of circle
    
    Returns:
        Icon as PIL Image
    """
    # Calculate padding (reduced for better visibility)
    padding = int(size * PADDING_PERCENT)
    image_size = size - (padding * 2)
    
    # Smart crop and resize the profile image
    profile_img = smart_crop_center(image, image_size)
    
    # Create base icon with gradient background
    icon = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    
    # Draw gradient background (vertical gradient - faster and looks professional)
    draw = ImageDraw.Draw(icon)
    for y in range(size):
        # Calculate gradient color for this row
        ratio = y / size
        r = int(GRADIENT_START[0] * (1 - ratio) + GRADIENT_END[0] * ratio)
        g = int(GRADIENT_START[1] * (1 - ratio) + GRADIENT_END[1] * ratio)
        b = int(GRADIENT_START[2] * (1 - ratio) + GRADIENT_END[2] * ratio)
        color = (r, g, b, 255)
        
        # Draw horizontal line for this row
        draw.line([(0, y), (size, y)], fill=color)
    
    # Create mask for shape
    mask = Image.new('L', (size, size), 0)
    mask_draw = ImageDraw.Draw(mask)
    
    if use_rounded_square:
        # Rounded square mask (draw manually since rounded_rectangle may not be available)
        corner_radius = int(size * 0.22)
        # Draw rounded rectangle manually
        # Main rectangle
        mask_draw.rectangle(
            [corner_radius, 0, size - corner_radius - 1, size - 1],
            fill=255
        )
        mask_draw.rectangle(
            [0, corner_radius, size - 1, size - corner_radius - 1],
            fill=255
        )
        # Rounded corners
        mask_draw.ellipse([0, 0, corner_radius * 2, corner_radius * 2], fill=255)
        mask_draw.ellipse([size - corner_radius * 2 - 1, 0, size - 1, corner_radius * 2], fill=255)
        mask_draw.ellipse([0, size - corner_radius * 2 - 1, corner_radius * 2, size - 1], fill=255)
        mask_draw.ellipse([size - corner_radius * 2 - 1, size - corner_radius * 2 - 1, size - 1, size - 1], fill=255)
    else:
        # Circular mask
        mask_draw.ellipse([0, 0, size - 1, size - 1], fill=255)
    
    # Apply smooth edges
    mask = mask.filter(ImageFilter.GaussianBlur(radius=0.5))
    
    # Paste profile image centered on gradient
    paste_x = padding
    paste_y = padding
    icon.paste(profile_img, (paste_x, paste_y))
    
    # Apply shape mask
    icon.putalpha(mask)
    
    return icon


def create_circular_icon(image: Image.Image, size: int, add_border: bool = False) -> Image.Image:
    """
    Create a circular icon from an image (legacy function for compatibility).
    
    Args:
        image: Source PIL Image
        size: Target size in pixels
        add_border: Whether to add a subtle border
    
    Returns:
        Circular icon as PIL Image
    """
    return create_icon_with_background(image, size, use_rounded_square=False)


def generate_android_icons(source_image: Image.Image, output_dir: Path):
    """Generate all Android icon sizes."""
    print("Generating Android icons...")
    android_dir = output_dir / 'android' / 'app' / 'src' / 'main' / 'res'
    
    for density, size in ANDROID_SIZES.items():
        density_dir = android_dir / density
        density_dir.mkdir(parents=True, exist_ok=True)
        
        # Create icon with gradient background
        icon = create_icon_with_background(source_image, size, use_rounded_square=USE_ROUNDED_SQUARE)
        
        # Convert to RGB for PNG (Android doesn't need transparency for launcher icons)
        # Use white background for better compatibility
        icon_rgb = Image.new('RGB', icon.size, BACKGROUND_COLOR)
        if icon.mode == 'RGBA':
            # Composite with alpha channel
            alpha = icon.split()[3]
            icon_rgb.paste(icon, mask=alpha)
        else:
            icon_rgb.paste(icon)
        
        output_path = density_dir / 'ic_launcher.png'
        # Save with high quality
        icon_rgb.save(output_path, 'PNG', optimize=False, compress_level=1)
        print(f"  ✓ {density}/ic_launcher.png ({size}x{size})")


def generate_ios_icons(source_image: Image.Image, output_dir: Path):
    """Generate all iOS icon sizes."""
    print("Generating iOS icons...")
    ios_dir = output_dir / 'ios' / 'Runner' / 'Assets.xcassets' / 'AppIcon.appiconset'
    ios_dir.mkdir(parents=True, exist_ok=True)
    
    for icon_config in IOS_SIZES:
        size = icon_config['size']
        scale = icon_config['scale']
        filename = icon_config['filename']
        
        actual_size = int(size * scale)
        # iOS icons should be square with rounded corners (system applies mask)
        # But we create circular for better appearance
        icon = create_icon_with_background(source_image, actual_size, use_rounded_square=False)
        
        # iOS icons should have transparency support
        # Convert to RGB with alpha channel preserved
        if icon.mode != 'RGBA':
            icon = icon.convert('RGBA')
        
        # For iOS, we can keep transparency or use white background
        # Using white background for better compatibility
        icon_rgb = Image.new('RGB', icon.size, BACKGROUND_COLOR)
        if icon.mode == 'RGBA':
            alpha = icon.split()[3]
            icon_rgb.paste(icon, mask=alpha)
        else:
            icon_rgb.paste(icon)
        
        output_path = ios_dir / filename
        # Save with high quality
        icon_rgb.save(output_path, 'PNG', optimize=False, compress_level=1)
        print(f"  ✓ {filename} ({actual_size}x{actual_size})")


def main():
    """Main function."""
    # Get project root (assuming script is in scripts/ directory)
    script_dir = Path(__file__).parent
    project_root = script_dir.parent
    
    # Get source image path
    if len(sys.argv) > 1:
        source_path = Path(sys.argv[1])
    else:
        source_path = project_root / 'assets' / 'icons' / 'profile.jpg'
    
    # Validate source image
    if not source_path.exists():
        print(f"Error: Source image not found at {source_path}")
        print(f"Usage: python {sys.argv[0]} [source_image_path]")
        sys.exit(1)
    
    print(f"Source image: {source_path}")
    
    # Load source image
    try:
        source_image = Image.open(source_path)
        print(f"Loaded image: {source_image.size[0]}x{source_image.size[1]} ({source_image.mode})")
    except Exception as e:
        print(f"Error loading image: {e}")
        sys.exit(1)
    
    # Convert to RGB if needed
    if source_image.mode != 'RGB':
        source_image = source_image.convert('RGB')
    
    # Generate icons
    print("\n" + "="*50)
    generate_android_icons(source_image, project_root)
    print("\n" + "="*50)
    generate_ios_icons(source_image, project_root)
    print("\n" + "="*50)
    print("✓ All app icons generated successfully!")
    print("\nNext steps:")
    print("1. Review the generated icons")
    print("2. Run: flutter clean")
    print("3. Run: flutter pub get")
    print("4. Build and test the app")


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nOperation cancelled by user.")
        sys.exit(1)
    except Exception as e:
        print(f"\nError: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)

