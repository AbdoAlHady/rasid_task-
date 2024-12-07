import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:task/models/personal_information_model.dart';

class PdfHeaderSection {
  const PdfHeaderSection._();

  static late String githupSvg;
  static late String emailSvg;
  static late String phoneSvg;
  static late String linkedInSvg;

  static Future<void> loadSvgs() async {
    githupSvg = await rootBundle.loadString('assets/svgs/github_logo.svg');
    emailSvg = await rootBundle.loadString('assets/svgs/email.svg');
    phoneSvg = await rootBundle.loadString('assets/svgs/phone.svg');
    linkedInSvg = await rootBundle.loadString('assets/svgs/linkedIn_logo.svg');
  }

  static Widget buildHeaderSection(
      {required PersonalInformationModel personalInformation,
      required String lang}) {
    String github = lang == 'en' ? 'GitHub' : 'جيت هاب';
    String linkedIn = lang == 'en' ? 'LinkedIn' : 'لينكد إن';
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            personalInformation.name ?? '',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(width: 10),
          Center(
            child: Text(
              personalInformation.jopTitle ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: PdfColors.grey,
              ),
            ),
          ),
          //  SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildContactInfo(emailSvg, personalInformation.email ?? ''),
              Spacer(),
              _buildContactInfo(phoneSvg, personalInformation.phone ?? ''),
              Spacer(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildContactInfo(
                linkedInSvg,
                linkedIn,
                isUrl: true,
                url: personalInformation.linkedIn!,
              ),
              Spacer(),
              _buildContactInfo(
                githupSvg,
                github,
                isUrl: true,
                url: personalInformation.github!,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildUrlLink(String url, String text) {
    return Link(
      destination: url,
      child: Text(text,
          style: const TextStyle(
            color: PdfColors.blue,
            decoration: TextDecoration.underline,
          )),
    );
  }

  static Widget _buildContactInfo(String svgIcon, String text,
      {bool isUrl = false, String url = ''}) {
    return Row(
      children: [
        SvgImage(
          svg: svgIcon,
          width: 20,
          height: 20,
        ),
        SizedBox(width: 5),
        isUrl == true
            ? _buildUrlLink(url, text)
            : Text(
                text,
              )
      ],
    );
  }
}
