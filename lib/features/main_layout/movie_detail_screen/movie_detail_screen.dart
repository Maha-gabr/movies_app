import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/app_color.dart';
import 'package:movies_app/core/resources/app_text_style.dart';
import 'package:movies_app/core/widget/app_toast.dart';
import 'package:movies_app/cubits/user_cubit/auth_states.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_cast_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_detail_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_genres_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/movie_screenshot_widget.dart';
import 'package:movies_app/features/main_layout/movie_detail_screen/widgets/similar_movies_widget.dart';
import '../../../core/firebase_utiles/firebase_utiles.dart';
import '../../../cubits/user_cubit/auth_cubit.dart';
import '../../../cubits/user_movies_cubit/user_movies_cubit.dart';
import '../../../cubits/user_movies_cubit/user_movies_states.dart';
import '../../../models/movies/movie_detail_model.dart';
class MovieDetailScreen extends StatefulWidget {
  final MovieDetailModel movie;
  const MovieDetailScreen({super.key,required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final uid = context.read<AuthCubit>().myUser?.id;
      if (uid != null) {
        context.read<UserMovieCubit>().fetchWatchlist(uid);
      }
    },
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            BlocBuilder<AuthCubit, AuthStates>(
              builder: (context, state) {
                final uid = context.watch<AuthCubit>().myUser?.id;
                return BlocBuilder<UserMovieCubit, UserMovieState>(
                  builder: (context, state) {
                    final favoriteMovies = BlocProvider.of<UserMovieCubit>(context).watchMovies;
                    final bool isAdded = favoriteMovies.any((m) => m.id == widget.movie.id);
                    return MovieDetailWidget(
                    movie : widget.movie,
                isSelected: isAdded,
                  onPressed: ()async{
                      // context.read<UserMovieCubit>().fetchWatchlist(uid??"");
                    if (uid != null) {
                      // Now you have access to both the UID and the Movie
                     await FirebaseUtils.toggleWatchlist(uid, widget.movie);
                    } else {
                      AppToast.appToast(text: 'Please login first');
                      // Handle unauthenticated user (e.g., show login snackbar)
                    }
                    print(uid);
                    print(widget.movie.id);
                    print('🚩🚩🚩');
                  },
                );
                  },
                );
              },
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Screen Shots',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieScreenshotWidget(movie: widget.movie),
                  SizedBox(height: 5.h,),
                  Text('Similar',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  SimilarMoviesWidget(movie : widget.movie),
                  Text('Summary',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  Text(widget.movie.summary,style: AppTextStyle.regWhit16,),
                  SizedBox(height: 5.h,),
                  Text('Cast',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieCastWidget(movie: widget.movie),
                  Text('Genres',style: AppTextStyle.boldWhite24,textAlign: TextAlign.start,),
                  SizedBox(height: 5.h,),
                  MovieGenresWidget(movie: widget.movie),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
