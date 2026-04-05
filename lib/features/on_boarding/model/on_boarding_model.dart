import 'package:movies_app/core/resources/app_assets.dart';

class OnBoardingModel {
final String image ;
final String title ;
final String description;
 const OnBoardingModel({required this.image,required this.title,required this.description});

 static List<OnBoardingModel> get getOnBoardingList{
   return [
     OnBoardingModel(image: AppAssets.onBoardingList[0], title: 'Find Your Next Favorite Movie Here', description: 'Get access to a huge library of movies to suit all tastes. You will surely like it.'),
     OnBoardingModel(image: AppAssets.onBoardingList[1], title: 'Discover Movies', description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.'),
   OnBoardingModel(image: AppAssets.onBoardingList[2], title: 'Explore All Genres', description: 'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.'),
     OnBoardingModel(image: AppAssets.onBoardingList[3], title: 'Create Watchlists', description: 'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.'),
     OnBoardingModel(image: AppAssets.onBoardingList[4], title: 'Rate, Review, and Learn', description: 'Share your thoughts on the movies you\'ve watched. Dive deep into film details and help others discover great movies with your reviews.'),
     OnBoardingModel(image: AppAssets.onBoardingList[5], title: 'Start Watching Now', description: ''),
   ];
 }

}