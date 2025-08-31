import 'package:arslan_flutter_portfolio/core/constants/images.dart';
import 'package:arslan_flutter_portfolio/core/constants/text_strings.dart';
import 'package:arslan_flutter_portfolio/features/widgets/homeSecctions/testimonialSection/testimonial_card.dart';

final skills = [
  {'icon': AppImages.flutter, 'label': TextStrings.flutter, 'value': 0.85},
  {'icon': AppImages.bloc, 'label': TextStrings.bloc, 'value': 0.80},
  {
    'icon': AppImages.flutterFlow,
    'label': TextStrings.flutterFlow,
    'value': 0.80,
  },
  {'icon': AppImages.firebase, 'label': TextStrings.firebase, 'value': 0.80},
  {'icon': AppImages.supabase, 'label': TextStrings.supabase, 'value': 0.75},
  {'icon': AppImages.postgres, 'label': TextStrings.postgreSQL, 'value': 0.70},
  {'icon': AppImages.restAPI, 'label': TextStrings.restAPI, 'value': 0.80},
  {'icon': AppImages.mongoDB, 'label': TextStrings.mongoDB, 'value': 0.65},
  {'icon': AppImages.nodeJS, 'label': TextStrings.nodeJS, 'value': 0.50},
  {'icon': AppImages.figma, 'label': TextStrings.figma, 'value': 0.85},
  {
    'icon': AppImages.testing,
    'label': TextStrings.flutterTesting,
    'value': 0.70,
  },
  {'icon': AppImages.jira, 'label': TextStrings.jira, 'value': 0.60},
  {'icon': AppImages.cicd, 'label': TextStrings.cicd, 'value': 0.70},
  {'icon': AppImages.github, 'label': TextStrings.github, 'value': 0.85},
];

final List<TestimonialCard> testimonials = [
  TestimonialCard(
    clientName: "Atif Khan",
    role: "CTO, Tech Solutions",
    feedback:
        "He combines creativity with technical expertise, building user-friendly applications that focus on performance and usability.",
  ),
  TestimonialCard(
    clientName: "Arsin Hove",
    role: "CEO, Creative Studio",
    feedback:
        "Professional, consistent, and innovative — always delivers projects on time with high-quality results.",
  ),
  TestimonialCard(
    clientName: "John Doe",
    role: "Founder, Startup Inc.",
    feedback:
        "An exceptional developer who always goes the extra mile to ensure client satisfaction.",
  ),
  TestimonialCard(
    clientName: "Emma Wilson",
    role: "Product Manager, AppWorks",
    feedback:
        "Very detail-oriented and proactive. His solutions improved our app performance by 40%.",
  ),
  TestimonialCard(
    clientName: "Michael Lee",
    role: "Director, CloudSoft",
    feedback:
        "Reliable, trustworthy, and highly skilled. His work ethic and dedication set him apart from others.",
  ),
];
final List<Map<String, String>> blogs = [
  {
    "images": AppImages.blog1,
    "category": "UI Design",
    "date": "04 April, 2024",
    "title": "How To Build An Ecommerce User-Friendly Website",
    "description":
        "Discover unparalleled business insight to innovative strategies with Catalyst empowering your enterprise to thrive in digital commerce.",
    "action": "Learn More →",
  },
  {
    "images": AppImages.blog2,
    "category": "Mobile Development",
    "date": "12 May, 2024",
    "title": "Top 5 Flutter Tips For Faster App Development",
    "description":
        "Boost your productivity with Flutter. Explore five powerful techniques to write cleaner, more efficient code and deliver apps faster.",
    "action": "Read More →",
  },
  {
    "images": AppImages.blog3,
    "category": "Web Development",
    "date": "22 June, 2024",
    "title": "Mastering Responsive Web Design",
    "description":
        "Learn how to craft beautiful, adaptive layouts that seamlessly fit any screen size for better user experiences.",
    "action": "Explore →",
  },
  {
    "images": AppImages.blog1,
    "category": "Branding",
    "date": "10 July, 2024",
    "title": "Why Consistency Is Key To Strong Branding",
    "description":
        "Uncover why visual and tone consistency across digital platforms builds stronger, trustworthy brand identity.",
    "action": "Discover More →",
  },
  {
    "images": AppImages.blog1,
    "category": "Technology Trends",
    "date": "30 August, 2024",
    "title": "AI in 2024: Transforming Businesses",
    "description":
        "A look at how artificial intelligence is reshaping industries, enhancing productivity, and creating new opportunities.",
    "action": "Read More →",
  },
];
