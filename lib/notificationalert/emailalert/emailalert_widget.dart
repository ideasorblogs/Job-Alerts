import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'emailalert_model.dart';
export 'emailalert_model.dart';

class EmailalertWidget extends StatefulWidget {
  const EmailalertWidget({super.key});

  @override
  State<EmailalertWidget> createState() => _EmailalertWidgetState();
}

class _EmailalertWidgetState extends State<EmailalertWidget> {
  late EmailalertModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailalertModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: const Color(0xFFF5F0BB),
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
            title: AutoSizeText(
              FFLocalizations.of(context).getText(
                'hb1dp7zf' /* Job Alerts */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Outfit',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
              minFontSize: 18.0,
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.5,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 173.0,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 50.0, 25.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'w0yltchj' /* Email Alert */,
                          ),
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 24.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0syvmz4s' /* Please enter your email addres... */,
                            ),
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0x2B14181B),
                        ),
                      ],
                    ),
                  ),
                ),
                const FlutterFlowWebView(
                  content:
                      '<iframe width=\"540\" height=\"305\" src=\"https://c01a7d29.sibforms.com/serve/MUIFAP1Wfe55cPIlT17_g9yrGmruK9hwNZaI3_vud7_ETYFh5gLG8CsDyJp0i29thfCdlXX_1j7C2pxhIXF939ElJ8yBnUITTjSOfpoVm8xdd5O1ZPDZ9wJmeqZ1bl0KdgH81Abp9O39yda3WmA6pq3eK5-yeII9gLQ0yeDv62Xz_YTswYnluFXjXDLJOOVTP-3N7WA9s0P6u8_C\" frameborder=\"0\" scrolling=\"auto\" allowfullscreen style=\"display: block;margin-left: auto;margin-right: auto;max-width: 100%;\"></iframe>',
                  height: 350.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                  html: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
