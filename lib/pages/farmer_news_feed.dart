import 'package:agrichapchap/types/news_feed.dart';
import 'package:flutter/material.dart';

class FarmerNewsFeed extends StatelessWidget {
  final List<NewsFeed> newsFeed = [
    NewsFeed(
      topic: 'Sustainable Farming Practices',
      body:
          'Sustainable farming practices help maintain the health of the land for future generations. Techniques such as crop rotation, organic farming, and reduced tillage can improve soil health, conserve water, and reduce the need for chemical inputs.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Pest and Disease Management',
      body:
          'Effective pest and disease management are crucial for healthy crops. Integrated Pest Management (IPM) strategies combine biological control, cultural practices, and the use of resistant varieties to reduce reliance on chemical pesticides.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Latest Trends in Organic Farming',
      body:
          'Organic farming is gaining popularity as consumers demand healthier, chemical-free food. Learn about the latest trends, including innovative organic fertilizers, pest control methods, and certification processes that can help you transition to or improve your organic farming practices.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Advances in Agricultural Technology',
      body:
          'The agricultural sector is rapidly evolving with new technologies. From drones and sensors for precision farming to AI and machine learning for predictive analytics, discover how these advancements can help you increase efficiency and productivity on your farm.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Soil Health and Management',
      body:
          'Healthy soil is the foundation of successful farming. Learn about soil testing, nutrient management, and soil conservation practices that can help you maintain fertile, productive land while minimizing environmental impact.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Water Conservation Techniques',
      body:
          'Water is a precious resource, and conserving it is essential for sustainable agriculture. Explore techniques such as drip irrigation, rainwater harvesting, and soil moisture monitoring to optimize water usage and ensure your crops get the hydration they need.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Climate Change and Agriculture',
      body:
          'Climate change poses significant challenges to agriculture, including altered weather patterns and increased pest pressures. Learn how to adapt your farming practices to these changes through resilient crop varieties, agroforestry, and climate-smart farming techniques.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Financial Management for Farmers',
      body:
          'Effective financial management is key to a successful farming business. Get tips on budgeting, accessing credit, managing cash flow, and understanding market trends to make informed financial decisions and ensure the profitability of your farm.',
      imageUrl: 'https://example.com/images/financial_management.jpg',
    ),
    NewsFeed(
      topic: 'Farm Safety Tips',
      body:
          'Ensuring safety on the farm is crucial for preventing accidents and injuries. Learn about best practices for handling machinery, using protective gear, and maintaining a safe working environment for you and your workers.',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    NewsFeed(
      topic: 'Crop Diversification Benefits',
      body:
          'Diversifying your crops can provide economic stability and environmental benefits. Explore the advantages of growing a variety of crops, including improved soil health, reduced pest pressures, and access to multiple markets to enhance your farm\'s resilience and profitability.',
      imageUrl: 'https://example.com/images/crop_diversification.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsFeed.length,
      itemBuilder: (context, index) {
        final newsItem = newsFeed[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: SizedBox(
            height: 200,
            width: 100,
            child: _buildImage(newsItem.imageUrl),
          ),
          title: Text(
            newsItem.topic,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _truncateDescription(newsItem.body, 15),
            style: TextStyle(color: Colors.grey[700]),
          ),
          isThreeLine: true,
        );
      },
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://plus.unsplash.com/premium_photo-1661962692059-55d5a4319814?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1523349122880-44486ffa7b14?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.cover,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildImage(String imageUrl) {
  //   return Stack(
  //     children: [
  //       Positioned.fill(
  //         child: Image.asset(
  //           'https://images.unsplash.com/photo-1492496913980-501348b61469?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //           width: 100,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       Positioned.fill(
  //         child: Image.network(
  //           imageUrl,
  //           width: 100,
  //           fit: BoxFit.cover,
  //           loadingBuilder: (context, child, loadingProgress) {
  //             if (loadingProgress == null) {
  //               return child;
  //             } else {
  //               return Center(
  //                 child: Image.network(
  //                   'https://images.unsplash.com/photo-1523349122880-44486ffa7b14?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //                   width: 100,
  //                   fit: BoxFit.cover,
  //                 ),
  //               );
  //             }
  //           },
  //           errorBuilder: (context, error, stackTrace) {
  //             return Image.network(
  //               'https://plus.unsplash.com/premium_photo-1661962692059-55d5a4319814?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  //               width: 100,
  //               fit: BoxFit.cover,
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  String _truncateDescription(String description, int wordLimit) {
    final words = description.split(' ');
    if (words.length > wordLimit) {
      return words.take(wordLimit).join(' ') + '...';
    } else {
      return description;
    }
  }
}
