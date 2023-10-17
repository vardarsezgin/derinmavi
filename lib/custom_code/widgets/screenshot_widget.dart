// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom widgets
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotWidget extends StatefulWidget {
  const ScreenshotWidget({
    Key? key,
    this.width,
    this.height,
    required this.bodyContent,
    required this.headerContent,
    required this.footerContent,
    required this.logoPath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String bodyContent;
  final String headerContent;
  final String logoPath;
  final String footerContent;

  @override
  _ScreenshotWidgetState createState() => _ScreenshotWidgetState();
}

class _ScreenshotWidgetState extends State<ScreenshotWidget> {
  final screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      captureAndShareScreenshot();
    });
  }

  void captureAndShareScreenshot() async {
    await Future.delayed(Duration(milliseconds: 500));
    final image = await screenshotController.capture();

    if (image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/screenshot.png';
      final file = File(imagePath);
      await file.writeAsBytes(image);

      await Share.shareFiles([imagePath]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.height,
      width: widget.width,
      child: Screenshot(
        controller: screenshotController,
        child: Builder(
          // Wrap the widget with Builder
          builder: (context) => Container(
            width: widget.width,
            height: widget.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        widget.logoPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 60),
                  child: Semantics(
                    label: 'horoscopeCapture',
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 5, 0),
                          child: Text(
                            widget.headerContent!,
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            widget.bodyContent!.maybeHandleOverflow(
                              maxChars: 500,
                              replacement: '…',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.footerContent!,
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          captureAndShareScreenshot();
                        },
                        child: Icon(
                          Icons.ios_share,
                          color: Colors.black,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
