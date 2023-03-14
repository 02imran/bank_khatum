

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_merchant/screen/about_us/about_us_controller.dart';
import 'package:wallet_merchant/shared_prefs_helper.dart';
import 'package:wallet_merchant/size_config.dart';


import '../../constants.dart';
import 'package:get/get.dart';

class TermsAndConditions extends GetView<AboutUsController> {




  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AboutUsController>(
          () => AboutUsController(), fenix: true,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("ABOUT"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(

          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
          const  Center(child:  Text('Terms And Conditions', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),)),
            SizedBox(height: getProportionateScreenHeight(20)),
           const Text('Introduction', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(20)),
            const Text('''Please note that these T&amp;Cs will be incorporated into any Physical Contract we may execute with you in future and will be enforceable against you to the same extent as the terms of the Physical Contract. Therefore we request you to please read these T&amp;Cs carefully before clicking on the "Terms and Conditions" checkbox.
Please go through these terms carefully. It is important that you spend time reading the terms as they constitute a legal agreement ("Agreement") between https://www.MLajan.com/ (the "Website" or "Site") and
A merchant establishment which allows its customers the option to make a purchase using their MLajan Wallet ("Merchant", "you" or "User"); or
An internet surfer ("you" or "User").
One MLajan Financial Technology Services Limited ("MLajan" "we" or "us", which also includes its affiliates) is an authorized payment and settlement system under the Money Service Business Act No. 8 of Dominica. We issue semi-closed system prepaid payment instruments ("MLajan Wallet") to Holders on which they can load and transfer funds in EC currency within Dominica to make purchases or avail of certain financial services ("Service(s)"). MLajan has its registered office situated at 40 King George V St. Roseau, Dominica. We have employees and authorized representatives ("Team").
These Terms of Use ("Terms") including our Privacy Policy define the terms and conditions under which you\'re allowed to use the Website and how we\'ll treat your account and MLajan Wallet while you are a member. If you have any questions about our terms, feel free to contact us at info@MLajan.com''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('YOUR AGREEMENT WITH MLAJAN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We reserve the right to modify the Terms at any time without giving you any prior notice. Your use of the Website following any such modification constitutes your agreement to follow and be bound by the Terms as modified. Any additional terms and conditions, disclaimers, privacy policies and other policies applicable in general and/ or to specific areas of this Website or to particular Service are also considered as Terms.
You acknowledge that you will be bound by this Agreement for availing any of the Services offered by us. Your access to use of the Website and the Services will be solely at the discretion of MLajan.The Agreement is published in compliance of, and is governed by the provisions of Dominican laws, including but limited to:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Money Service Business Act 2010;
• Companies Act 1994;
• Money Laundering (Prevention) Act 2011
• Money Laundering (Prevention) Regulations S.R.O.14 of 2011; 2013''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold,height: 2.3), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('APPROVAL OF TERMS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''By using the Website and its Services, you agree that you have read and understood these Terms and you agree to be bound by these Terms and use the Services in compliance with these Terms. Please read these Terms carefully. If you do not agree to be bound by (or cannot comply with) any of the terms below, please leave the Website immediately and terminate your account with us. The information that you obtain or receive from MLajan, its Team, contractors, partners, sponsors, advertisers or otherwise on the Website is for informational and scheduling purposes only.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            const Text('''The information provided on the Website is not professional advice and must not be considered as such. Your use of information provided on the Website is solely at your own risk.
You can accept the Terms by:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Using the Website; or''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• By actually using the Services. In this case, you understand and agree that MLajan will treat your use of the Services as acceptance of the Terms from that point onwards.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• For being a valid User you must satisfy the following conditions:''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You are of legal age to form a binding contract with MLajan; or''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''By using the Website and its Services, you agree that you have read and understood these Terms and you agree to be bound by these Terms and use the Services in compliance with these Terms. Please read these Terms carefully. If you do not agree to be bound by (or cannot comply with) any of the terms below, please leave the Website immediately and terminate your account with us. The information that you obtain or receive from MLajan, its Team, contractors, partners, sponsors, advertisers or otherwise on the Website is for informational and scheduling purposes only.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            const Text('''You are not a person barred from receiving the Services under the laws of Dominica or other countries including the country in which you are resident or from which you use the services.
I give consent to MLajan to collect KYC documents on my behalf.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('INFORMATION PRESENTATION/ EDITORIAL CONTROL', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We make the Website available as a part of our Service to Holders and Merchants. We may, but have no obligation to, have non user-posted information reviewed by the Website\'s editorial personnel.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''It is important to note, however, that the timeliness and accuracy of any or all of the information is not guaranteed. Neither the authors, the editorial personnel, nor any other party who has been involved in the preparation or publication of this work can assure you that the information contained herein is in every respect accurate or complete, and they are not responsible for any errors or omissions or for the results obtained from the use of such information.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('USE OF SERVICES AND INFORMATION ON THE WEBSITE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''In order to access certain Services, you may be required to provide information about yourself (such as identification, contact or payment details) as part of the registration process for the Service, or as part of your continued use of the Services. You agree that any registration information you give to us will always be true, accurate, correct, complete and up to date. Any phone number used to register with the Website needs to be registered in your name and you might be asked to provide supporting documents to prove the same.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan securely transmits and saves your data including but not limiting to the interactions done by the user on the MLajan App, the transactions undertaken by the user via MLajan including the exchange of short message service, to our secure servers. The same enables MLajan to not only serve its users with better offers but also with reminders and notifications for activities more in-line for users interests.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Information provided by MLajan or otherwise obtained from the Website will not be used for any unauthorized and unlawful purpose;
You agree not to access (or attempt to access) any of the Services by any means other than through the interface that is provided by MLajan, unless you have been specifically allowed to do so in a separate agreement with us;''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You agree that you will not engage in any activity that interferes with or disrupts the Services (or the servers and networks which are connected to the Services);
You agree that you will not reproduce, duplicate, copy, transfer, license, rent, sell, trade or resell the information obtained from the Website for any purpose whatsoever;
You agree that you are solely responsible for (and that MLajan has no responsibility to you or to any third party for) any breach of your obligations under the Terms and for the consequences (including any loss or damage which MLajan may suffer) of any such breach.
You will not impersonate another person, including, without limitation, a Holder or a Merchant.
You agree to the use of your data in accordance with MLajan\'s Privacy Policy''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''All personal and contact information provided by you will be kept confidential by MLajan. This includes your personal information given in relation to your account creation and subsequent administration.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('CONTENT YOU POST OR SUBMIT', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''On creation of an account on the Website, you will have the opportunity to use various interactive aspects through which you can communicate with our Team and share information (collectively "Posted Information"). It is important that you act responsibly when providing such Posted Information. Do not use inappropriate language, make gratuitous personal criticisms or comments. When participating in interactive aspects of the Service, please do include all relevant information in a concise manner to help us provide you with a helpful response.
Please note that:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You are solely responsible for any Posted Information that you submit on the Website or transmit to our Team and/or other users of the Website''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You may not post, distribute, or reproduce in any way any copyrighted material, trademarks, or other proprietary information without obtaining the prior written consent of the owner of such proprietary rights. You may not submit any content or material that infringes, misappropriates or violates the intellectual property, publicity, privacy or other rights of any party;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You may not provide any Posted Information that falsely expresses or implies that such content or material is sponsored or endorsed by MLajan;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You may not provide any Posted Information that is unlawful or that promotes or encourages illegal activity;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You understand and agree that MLajan may (but is not obligated to) review and delete any Posted Information that in the sole judgment of MLajan violates these Terms or which might be offensive, illegal, or that might violate the rights of, harm, or threaten the safety of other users of the Website and/or any other person;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You agree that you will only provide Posted Information that you believe to be true and you will not purposely provide false or misleading information; and''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''The following is a partial list of the kind of content and communications that are illegal or prohibited on/through the Website. MLajan reserves the right to investigate and take appropriate legal action in its sole discretion against anyone who violates this provision, including without limitation, removing the offending communication from the Services and terminating the membership of such violators or blocking your use of the Services and/or the Website. You may not post content that:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Involves the transmission of unsolicited mass mailing or "spamming''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Harasses or advocates harassment of another person;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Is false or intentionally misleading;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Violates the intellectual property or other rights of any person;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Is threatening, obscene, defamatory or libellous; or''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Is pornographic or sexually explicit in nature.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You agree, through Your use of this Service, that you will not use this Website to post any material which known to be unlawful, false and/or defamatory, inaccurate, abusive, vulgar, hateful, harassing, libelous, harmful, obscene, profane, sexually oriented, threatening, racially offensive, invasive of a person\'s privacy, or otherwise objectionable material of any kind or nature. You agree not to post any copyrighted material unless the copyright is owned by You or You have been given permission by the copyright owner to post such material and You give due credit to the copyright owner by including the copyright information in your post.
You agree and acknowledge that you will not submit unlawful, offensive, inaccurate, misleading, abusive, pornographic, harassing, libelous, blasphemous, defamatory, obscene, paedophilic, invasive of another\'s privacy, hateful, racially or ethically objectionable, disparaging, relating to or encouraging money laundering or gambling, or otherwise inappropriate material.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Not upload or share any information that impersonates another person, threatens the unity, integrity, defence, security or sovereignty of Dominica;''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Obtain any consents, permission or licenses that may be legally required for you to submit any material;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Respect the privacy of others;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Not distribute or post spam, unreasonably large files, chain letters, pyramid schemes, viruses;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Not use any other technologies or initiate other activities that may harm the Service, or the interest or property of the Users; and''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Not use any automated systems or means to access, acquire, copy or monitor any part of the Service.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You will notify MLajan at MLajan Helpdesk upon coming across any objectionable content on the Website and MLajan shall use best efforts to remove such objectionable content within thirty-six hours from being duly notified.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('YOUR USE OF INFORMATION', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Except for Posted Information that you submit, all of the information available on or through the Services and/or the Website, including without limitation, text, photographs, graphics and video and audio content, is owned by us and our licensors and is protected by copyright, trademark, patent and trade secret laws, other proprietary rights and international treaties. You acknowledge that the Services and any underlying technology or software used in connection with the Services contain MLajan\'s proprietary information. We give you permission to use the aforementioned content for personal, non-commercial purposes only and do not transfer any intellectual property rights to you by virtue of permitting your use of the Services. You may print, download, and store information from the Website for your own convenience, but you may not copy, distribute, republish (except as permitted in this paragraph), sell, or exploit any of the content, or exploit the Website in whole or in part, for any commercial gain or purpose whatsoever. Except as is expressly and unambiguously provided herein, we do not grant you any express or implied rights, and all rights in the Website and the Services not expressly granted by us to you are retained by MLajan.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We make no guarantees, representations or warranties, whether expressed or implied, with respect to professional qualifications, expertise and quality of work or services or other information concerning the Team.
''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('USER RESPONSIBILITIES', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We make no guarantees, representations or warranties, whether expressed or implied, with respect to professional qualifications, expertise and quality of work or services or other information concerning the Team.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('PRIVACY AND INTELLECTUAL PROPERTY PROTECTION', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan\'s Privacy Policy explains how we treat your personal data and protect your privacy when you use our Services. By using our services, you agree that MLajan can use such data in accordance with our policies.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You agree and understand that you are responsible for maintaining the confidentiality of passwords associated with any account you use to access the Services.
You agree that you will be solely responsible to MLajan for all activities that occur under your account.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''If you become aware of any unauthorized use of your password or of your account, you agree to notify us immediately at MLajan Helpdesk.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''All trademarks, brands and service marks used in conjunction with the Services offered by MLajan and owned by MLajan shall be our property; MLajan shall own all of the copyrights and database rights in the Services. Without our consent, you may not publish, distribute, extract or reproduce any contents provided by the Services. For use of any third party\'s intellectual property, you need to get permission directly from the owner of the intellectual property for any use. Third party trademarks may appear on this Website and all rights therein are reserved to the registered owners of those trademarks.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''As a user of our Website, you acknowledge that any intellectual property which is not specifically mentioned to be owned by us is owned by their respective owners and the owners have a right to take appropriate actions against you for any violation, infringement and passing off.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Your use of the Services is at all times governed by and subject to laws regarding copyright, trademark, patent, and trade secret ownership and use of intellectual property. You agree not to upload, download, display, perform, transmit, or otherwise distribute any information or content in violation of any party\'s copyrights, trademarks, patents, trade secrets, or other intellectual property or proprietary rights. You agree to abide by laws regarding copyright, trademark, patent, and trade secret ownership and use of intellectual property, and you shall be solely responsible for any violations of any laws and for any infringements of any intellectual property rights caused by use of the interface/Website.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('THIRD PARTY INFORMATION ON THE WEBSITE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''As some information appearing on the Website is provided to MLajan by third parties, MLajan will have no liability in respect of any loss or damage arising from third party information which appears on the Website, including the manner in which the information is displayed or information which may be:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Out of date;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Inaccurate;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Duplication;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Impersonation by a person to be another person.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''All dealings and communication arising from MLajan\'s facilitation of interaction between Merchant and Holder will be between the Merchant and Holder only and MLajan is not responsible in any manner for any communication between the Holder and the Merchant, and has no liability in respect of such dealings whatsoever.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan is not an agent for any of the Merchants listed on this Website and MLajan has no responsibility for and no liability whatsoever in respect of the conduct of a Merchant or quality of service provided by a Merchant.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('LINKS TO OTHER SITES', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''The Services may include links to other websites. Some of these websites may contain materials that are objectionable, unlawful, or inaccurate. These links are provided for your convenience only and the provision of these links does not mean that we endorse these websites or the products and services they provide. You acknowledge and agree that we are not responsible or liable for the content or accuracy of these other websites.
You will note that the URL to every webpage on our Website begins with "https://". In other words, every webpage on our Website is hypertext transfer protocol secure ("HTTPS Enabled") or "identity verified".''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We have had our entire Website HTTPS Enabled to better protect your security against dummy websites. Please verify that a webpage is HTTPS Enabled before providing any information on it. We will not be liable for any consequences of you providing details on any third party website, including dummy websites.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('NO WARRANTIES', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''The interface/Website is provided subject to all of the terms set forth in the Terms.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan disclaims all warranties whether express or implied, including but not limited to:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• That our Website will always function without disruptions, delay or errors. A number of factors may impact the quality of your communications and use of the Website and may result in the failure of your communications including but not limited to: your local network, firewall, your internet service provider, the public internet, the public switched mobile network, private switched mobile networks and your power supply. We take no responsibility for any disruption, interruption or delay caused by any failure of or inadequacy in any of these items or any other items over which we have no control;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Your ability to use the Service through the Website;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Your satisfaction with the Service or the Website;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Security and privacy of your data;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• That bugs or errors in the Service and/or Website will be corrected;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• That our Services will be compatible with all broadband services and modems and we disclaim any express or implied warranties regarding the compatibility of our Service with any particular broadband service or modems;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''We make no express or implied representations or warranties about our Services or the Website and disclaim any implied warranties, including, but not limited to, warranties or implied warranties of merchantability or fitness for a particular purpose or use or non-infringement. We do not authorize anyone to make a warranty on our behalf and you may not rely on any statement of warranty as a warranty by us; and''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''That our Team who furnishes Services to you in connection with this Agreement or the Service will be liable for any act or omission in relation to the Website.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('RESTRICTIONS ON USE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''In addition to all Terms of this Agreement, you shall not:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Use the third party links to sites without agreeing to their website terms &amp; conditions;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Post links to third party websites or use their logo, company name, etc. without their prior written permission; or''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Use the Services for spamming and other illegal purposes.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('TERMINATION OF SERVICES', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Your account may be disabled and Services may be terminated based upon the representations made by you. Any of the following actions may result in termination of Services:''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),

            const Text('''• Impersonating another person or entity with the effect of misleading users about the identity of the creator of content (including misleading account user names, voices and sounds used in broadcasts, and account profile information);''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Impersonating the Services or a MLajan Team member;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Representing that content you post or transmit through the Services is created or endorsed by us;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Providing or sending any content which may be harmful or detrimental to MLajan or its business associates, or which violates any restriction or policy established by MLajan or its business associates;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Submission of any content that falsely expresses or implies that such content is sponsored or endorsed by us;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Falsification or deletion of any author attributions, legal or other proper notices or proprietary designations or labels of the origin or source of software or other material contained in a file that is posted;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Putting on MLajan's system any content that contains software viruses, trojan horses or any other computer code, files, or programs designed to interrupt, destroy, or limit functionality of any computer software or hardware or telecommunications equipment;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Manipulating Service identifiers in order to disguise the origin of any content transmitted via the Services;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Collecting or storing personal data about other users;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Interfering with or disrupting the Service or servers or networks connected to the Service, or disobeying any requirements, procedures, policies or regulations of networks connected to the Service;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Interfering with or disrupting the Service or servers or networks connected to the Service, or disobeying any requirements, procedures, policies or regulations of networks connected to the Service;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Using any robot, spider, website search/retrieval application, or other device to retrieve or index any portion of the Service or collect information about users for any unauthorized purpose; or''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Creating user accounts by automated means or under false or fraudulent pretences.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('SPAMMING', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You may not use contact information provided by us or other users or harvest such information for the purpose of sending, or to facilitate the sending, of unsolicited bulk communications such as spam. You may not allow others to use your account to violate the terms of this section. We may terminate your membership or access to the Website immediately and take other legal action if you or anyone using your credentials violates these provisions.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('ADDITIONAL TERMS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Certain Services on the Website may have additional terms (such as policies, guidelines, and rules) that will further govern your use of that particular service and supplement these Terms. If you choose to register for or access any such Services, you will be presented with any relevant additional terms and conditions at that time. By using those Services, you agree to comply with such additional guidelines and rules.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Unless otherwise indicated all offers validity, usage, eligibility, availability and or otherwise are subject to Terms and Conditions and may be available at select participating stores and or merchants only. Be certain to read the terms and conditions for each offer before use.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''In relation to some Offers and or Promotions, certain release requirements or, where appropriate, withdrawal and or earning restrictions must be satisfied, in addition to the general eligibility criteria set out in the Terms and Conditions made available on www.MLajan.com"''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('DISCLAIMER', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''The Service and the Website and its entire contents are provided on an 'as is' basis. MLajan and its officers, employees, agents and contractors give or make no representation or warranty (either express or implied) as to the suitability of the Service or the Website or its contents for any purpose or the completeness, accuracy, reliability, security or availability of the Service or the Website or its contents; nor do they accept any responsibility arising in any way (including from negligence) for errors in, or omissions from, the Service or the Website.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan and its officers, employees, agents and contractors are not liable for any loss, damage, claim, expense, cost (including legal costs) or liability arising directly or indirectly from your use or non-use of the Service or the Website, or your reliance upon the Service or the information contained upon the Website (whether arising from MLajan's or any other person's negligence or otherwise).''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You and MLajan agree that any cause of action arising out of your use of the Service or Website must be commenced within 12 (twelve) months after the cause of action accrues or you become aware of the facts giving rise to the cause of action, whichever is later. Otherwise, such cause of action is permanently barred.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Where any legislation implies any term, condition, representation or warranty into this Agreement or the Privacy Policy and that legislation prohibits exclusion of that term, condition, representation or warranty, then that term, condition, representation or warranty is included.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('GENERAL LIMITATION OF LIABILITY AND INDEMNIFICATION', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Your sole and exclusive remedy for any dispute with us is the suspension of your MLajan account. In no event shall our total cumulative liability to you for any and all claims relating to or arising out of your use of the Website, regardless of the form of action.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''In no event shall we be liable to you (or to any third party claiming under or through you) for any indirect, special, incidental, consequential or exemplary damages arising from your use of, or inability to use, the Website. These exclusions apply to any claims for lost profits, lost data, loss of goodwill, work stoppage, computer failure or malfunction, any other commercial damages or losses, even if we knew or should have known of the possibility of such damages.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You agree to defend, indemnify and hold MLajan, and its Team harmless from and against any claims, actions, demands, liabilities, judgments, and settlements, including without limitation, reasonable legal fees resulting from or alleged to result from your use of this Website.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''You hereby indemnify and hold MLajan, and its Team harmless from any loss, costs, damages, expenses, and liability caused by your use of the Website, your violation of this Agreement, or your violation of any rights of a third party through use of the Website.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('UNENFORCEABLE PROVISIONS', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''If any provision of these Terms is, or is found to be, unenforceable under applicable laws, that will not affect the enforceability of the other provisions of these Terms.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('GOVERNING LAW AND DISPUTE RESOLUTION', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Except as otherwise described, all content availed by the use of this Website/interface are made available only to facilitate the users. MLajan controls and operates the Website and Services and makes no representation that the contents and Services are appropriate or available for use in other locations. If you use the Services from a location other than the location where the Website and Services are controlled and operated, you are responsible for compliance with applicable local laws.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Online Terms and Conditions for Users''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Online Terms and Conditions for Merchants''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Online Terms and Conditions for Offers''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Grievance Policy''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Customer Protection and Liability Policy''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Know Your Customer (KYC)''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''User Form''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Documentation- LLP''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Documentation- Partnership''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Documentation- Pvt Ltd''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Documentation- Sole Proprietorship''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Documentation- Trust''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('GOVERNING LAW AND DISPUTE RESOLUTION', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan is an authorized Payment and Settlement System under the Payment and Settlement Act 2007.It issues semi closed Pre – paid instruments (“MLajan Wallet”) to Holders/Users on which they can load and transfer funds in Eastern Caribbean currency to make purchases of commodities or avail financial services from different Merchants.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''As per law and relevant KYC Guidelines , MLajan wallets are issued either on submission of Minimum Wallet ( “ Minimum KYC Wallet”) details which shall include mobile number verified with One Time Pin and self-declaration of name and unique identification number of any of the “ officially valid document” or on the submission of complete documents (“ KYC Compliant Wallet”) these shall only be issued after completing KYC of the Holder . MLajan Wallet will be valid for an indefinite period subject to the limitations provided under law; any changes to the same will be communicated by updating these terms and conditions''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('Minimum KYC Wallet Features', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Feature Conditions''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),

            const Text('''• Maximum outstanding Balance- The maximum outstanding balance must not exceed EC 10,000 at any point in time;''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Loading or Reloading of Funds-The total amount loaded or reloaded in the prepaid payment account during any given month shall not exceed EC 10,000 per transaction/per day without Declaration Source of Funds.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Transfer of funds- You will not be able to transfer money from such Min KYC accounts to other Money accounts or bank accounts. The only time you can transfer money out of this account is at the point of closure of your Wallet , at which point you would be required to transfer money to your own bank account post providing required bank account proof of ownership and after completing your Know Your Customer; or transfer money 'back to source' (payment source from where the money was loaded).''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Debit from prepaid account- The total amount debited from the prepaid payment account during any given month shall not exceed the limits set forth by the Regulator.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Expiry Period- Min KYC account will be valid for a period of 18 (eighteen) months from the date of issue/activation or as per timelines prescribed under applicable laws, post which you will be required to upgrade your account by providing requisite KYC information/ documentation to Mlajan.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Mandatory conversion to Full KYC Wallet- Minimum Wallet shall be converted to Full KYC* MLajan within a period of 18 (eighteen) months from the date of activation/issuance of the Minimum KYC Wallet, failing which no further credit shall be allowed in such Minimum KYC Wallet.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Making the Wallet account inactive- In case of no financial transaction for a consecutive period of 1 (one) year in the Prepaid Payment Account, MLajan shall make the Account inactive''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Usage of the Wallet- The wallet can be used only for purchase of goods and services. Fund transfer to other MLajan Wallet or to bank accounts is not permitted''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Closure of Wallet- At the time of closure , any outstanding balance in the wallet shall be transferred at the request of the holder to the ‘own bank account of Wallet holder’ or shall be transferred ‘back to source’ after complying with KYC requirements of the Wallet holder.
*Note: KYC documentation shall be in line with the prevailing FSU guidelines on (KYC) Know your Customer. Above parameters and limit capping is applicable as per the direction on issuance and operation of prepaid card instruments and subject to change as when new guidelines is issued by FSU''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan Wallet can be loaded through online payment methods such as domestic credit/debit card and net banking. However, you will not be able to use prepaid cards, EMI, cards issued outside Dominica or a combination of cards to add/load amount to your Wallet. Such loads will be as per the prescribed limits for Min KYC and Full KYC accounts, mentioned under these T&amp;Cs and as provided by FSU from time to time. Except as provided hereunder, amount in your Wallet will not be refunded to you under any circumstances. No refund will be provided in cash, at any point of time. No interest will be paid on the amount in the Wallet at any point of time.
The Login used for your MLajan Wallet shall give You access to all other Services being offered on our Platform .''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('Fees and Charges:', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''MLajan reserves its right, in its sole discretion and without any prior notice, to impose and/or revise charges/commissions in relation to the use of your MLajan Wallet. The current charges for your Wallet are provided hereunder , the same are subject to change;''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Schedule of charges Min KYC &amp; Full KYC Wallets
Service Charges (EC)''', style: TextStyle(fontSize: 12, color: Colors.grey), ),

            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Account opening 0''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Load Money Charges (Rs.)Through credit card/debit card/net banking 0''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Payment Charges - Payment at merchant 0''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Payment to Utility bill/recharges/DTH 0*''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Charges basis agreement with the merchant and aggregator subject to revision''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Transfer Charges -Wallet to wallet0''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• Wallet(Full KYC Only) to bank: 3.45% + GST of transaction amount''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• For Failed transactions, total amount including charges are reversed.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''• You agree and acknowledge that MLajan is only a facilitator and is not and cannot be a party to or control in any manner any transactions relating to purchase of goods and/or services using MLajan Wallet.''', style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('WALLET EXPIRY', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''There is no expiry date for your MLajan Wallet.
If you have any questions or concerns about this Agreement, please send us a thorough description to MLajan Helpdesk. We strive to respond to all User requests.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''If you have any questions or claims of copyright infringement, please contact us at MLajan Helpdesk.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(10)),
            const Text('''Need help ? We will be glad to assist you''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
            SizedBox(height: getProportionateScreenHeight(20)),







          ],
        ),
      ),

    );
  }

}
