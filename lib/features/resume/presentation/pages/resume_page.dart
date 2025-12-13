import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_filex/open_filex.dart';
import 'package:flutter/services.dart';
import '../../../../core/widgets/section_title.dart';

@RoutePage()
class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  PdfViewerController? _pdfController;
  bool _isLoading = true;
  String? _pdfPath;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      // Try to load PDF from assets
      final byteData = await rootBundle.load('assets/resume/resume.pdf');
      final file = File('${(await getTemporaryDirectory()).path}/resume.pdf');
      await file.writeAsBytes(byteData.buffer.asUint8List());
      
      setState(() {
        _pdfPath = file.path;
        _pdfController = PdfViewerController();
        _isLoading = false;
      });
    } catch (e) {
      // PDF not found in assets, show placeholder
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _downloadResume() async {
    if (_pdfPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resume file not found. Please add resume.pdf to assets/resume/'),
        ),
      );
      return;
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/Manish_Ranjan_Resume.pdf');
      await File(_pdfPath!).copy(file.path);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Resume downloaded to ${file.path}'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () => OpenFilex.open(file.path),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error downloading resume: $e')),
      );
    }
  }

  Future<void> _shareResume() async {
    if (_pdfPath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resume file not found. Please add resume.pdf to assets/resume/'),
        ),
      );
      return;
    }

    try {
      // await Share.shareFiles(
      //   [_pdfPath!],
      //   text: 'Manish Ranjan - Mobile App Developer Resume',
      // );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing resume: $e')),
      );
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _downloadResume,
            tooltip: 'Download Resume',
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareResume,
            tooltip: 'Share Resume',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pdfPath == null
              ? _buildPlaceholder(context)
              : Column(
                  children: [
                    Expanded(
                      child: SfPdfViewer.file(
                        File(_pdfPath!),
                        controller: _pdfController,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _downloadResume,
                            icon: const Icon(Icons.download),
                            label: const Text('Download'),
                          ),
                          ElevatedButton.icon(
                            onPressed: _shareResume,
                            icon: const Icon(Icons.share),
                            label: const Text('Share'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description,
              size: 80,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 24),
            Text(
              'Resume Viewer',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'To view your resume, please add resume.pdf to assets/resume/ folder',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Show contact info as alternative
                Navigator.pop(context);
              },
              icon: const Icon(Icons.contact_mail),
              label: const Text('Contact Me Instead'),
            ),
          ],
        ),
      ),
    );
  }
}

