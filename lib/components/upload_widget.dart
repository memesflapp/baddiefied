import 'package:cached_network_image/cached_network_image.dart';

import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'upload_model.dart';
export 'upload_model.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  late UploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          final selectedMedia = await selectMediaWithSourceBottomSheet(
            context: context,
            allowPhoto: true,
          );
          if (selectedMedia != null &&
              selectedMedia
                  .every((m) => validateFileFormat(m.storagePath, context))) {
            safeSetState(() => _model.isDataUploading = true);
            var selectedUploadedFiles = <FFUploadedFile>[];

            var downloadUrls = <String>[];
            try {
              showUploadMessage(
                context,
                'Uploading file...',
                showLoading: true,
              );
              selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                      ))
                  .toList();

              downloadUrls = (await Future.wait(
                selectedMedia.map(
                  (m) async => await uploadData(m.storagePath, m.bytes),
                ),
              ))
                  .where((u) => u != null)
                  .map((u) => u!)
                  .toList();
            } finally {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              _model.isDataUploading = false;
            }
            if (selectedUploadedFiles.length == selectedMedia.length &&
                downloadUrls.length == selectedMedia.length) {
              safeSetState(() {
                _model.uploadedLocalFile = selectedUploadedFiles.first;
                _model.uploadedFileUrl = downloadUrls.first;
              });
              showUploadMessage(context, 'Success!');
            } else {
              safeSetState(() {});
              showUploadMessage(context, 'Failed to upload data');
              return;
            }
          }
        },
        child: Container(
          width: 347.0,
          constraints: const BoxConstraints(
            maxHeight: 500.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                valueOrDefault<String>(
                  _model.uploadedFileUrl,
                  'https://media.istockphoto.com/id/1248723171/vector/camera-photo-upload-icon-on-isolated-white-background-eps-10-vector.jpg?s=612x612&w=0&k=20&c=e-OBJ2jbB-W_vfEwNCip4PW4DqhHGXYMtC3K_mzOac0=',
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      ),
    );
  }
}
