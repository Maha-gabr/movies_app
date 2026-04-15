import 'package:movies_app/core/resources/app_assets.dart';
import 'movie_detail_model.dart';

class MovieDetailModelResponse {
  static List<MovieDetailModel> get movieDetail {
    return [
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg',
        title: 'Black Widow',
        year: 2021,
        summary: 'Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.',
        movieDuration: 134,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Scarlett Johansson', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/mjReG6rR7NPMEIWb1T4YWtV11ty.jpg', character: 'Natasha Romanoff'),
          Cast(name: 'Florence Pugh', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/6Sjz9teWjrMY9lF2o9FCo4XmoRh.jpg', character: 'Yelena Belova'),
          Cast(name: 'David Harbour', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/qMFtMWlYVtFVyBoBhX5IoA5sN5a.jpg', character: 'Red Guardian'),
        ],
        screenShot: [
          "https://media.themoviedb.org/t/p/w500_and_h282_face/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg",
          'https://media.themoviedb.org/t/p/w500_and_h282_face/dGMpzHn9uNqBysBQ6Sp5xdOgM66.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/a6dDJW2xlKhwQRpDtWxzmy5Aq6s.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/8biauVsABUKLwKeDyfawi8wTggS.jpg',
        title: 'Hobbs & Shaw',
        year: 2019,
        summary: 'Lawman Luke Hobbs and outcast Shaw are forced to partner up when a cyber-genetically enhanced villain threatens the future of humanity.',
        movieDuration: 137,
        genres: ['Action', 'Adventure', 'Comedy'],
        cast: [
          Cast(name: 'Dwayne Johnson', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/5QApZVV8FUFlVxQpIK3Ew6cqotq.jpg', character: 'Luke Hobbs'),
          Cast(name: 'Jason Statham', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/pXGSq2UpcDE2NMF8LR56QZf5U1q.jpg', character: 'Deckard Shaw'),
          Cast(name: 'Idris Elba', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/be1bVF7qGX91a6c5WeRPs5pKXln.jpg', character: 'Brixton'),
        ],
        isFav: false,
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/hpgda6P9GutvdkDX5MUJ92QG9aj.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/egxh9sOtF9XMZVlqmxIEt5fUCIm.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/4w8hAIcujqPRBdd2ISieEneTipT.jpg'
        ]
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/iZf0KyrE25z1sage4SYFLCCrMi9.jpg',
        title: '1917',
        year: 2019,
        summary: 'Two young British soldiers are given an impossible mission: deliver a message deep in enemy territory to stop a deadly attack.',
        movieDuration: 119,
        genres: ['Drama', 'War', 'Thriller'],
        cast: [
          Cast(name: 'George MacKay', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/xROmV7s8QtAIfhTUPhVl7qB0H2z.jpg', character: 'Schofield'),
          Cast(name: 'Dean-Charles Chapman', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/xIVxI2ECxxN5J2XNkHPjRax0IHc.jpg', character: 'Blake'),
          Cast(name: 'Mark Strong', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/3cNmatYsoifytg7TfQhI1EHow3v.jpg', character: 'Captain Smith'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/2lBOQK06tltt8SQaswgb8d657Mv.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/3RarN70b6lohFJFVUdudXRQF6zi.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/t3VZPH4VS0LkpJjMR6T0ppsdavA.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg',
        title: 'The Avengers',
        year: 2012,
        summary: 'Earth\'s mightiest heroes must come together and learn to fight as a team to stop Loki and his alien army from enslaving humanity.',
        movieDuration: 143,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Robert Downey Jr.', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/5qHNjhtjMD4YWH3UP0rm4tKwxCL.jpg', character: 'Iron Man'),
          Cast(name: 'Chris Evans', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/3bOGNsHlrswhyW79uvIHH1V43JI.jpg', character: 'Captain America'),
          Cast(name: 'Chris Hemsworth', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/piQGdoIQOF3C1EI5cbYZLAW1gfj.jpg', character: 'Thor'),
        ],
        isFav: false,
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/9BBTo63ANSmhC4e6r62OJFuK2GL.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/gHLs7Fy3DzLmLsD4lmfqL55KGcl.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/7QTdhc1OoYItyQFFf6qNmFG6ro6.jpg'
        ]
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/cf7hE1ifY4UNbS25tGnaTyyDrI2.jpg',
        title: 'Avatar :Fire and Ash',
        year: 2025,
        summary: 'In the wake of the devastating war against the RDA and the loss of their eldest son, Jake Sully and Neytiri face a new threat on Pandora: the Ash People, a violent and power-hungry Na\'vi tribe led by the ruthless Varang. Jake\'s family must fight for their survival and the future of Pandora in a conflict that pushes them to their emotional and physical limits.',
        movieDuration: 149,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Sam Worthington', image: AppAssets.movieImage5, character: 'Jake'),
          Cast(name: 'Zoe Saldaña', image: AppAssets.movieImage5, character: 'Neytiri'),
          Cast(name: 'Sigourney Weaver', image: AppAssets.movieImage5, character: 'Kiri'),
        ],
        isFav: false,
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/iN41Ccw4DctL8npfmYg1j5Tr1eb.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/9QW8bQ0BK4GjtpHPuZvH6cfcBDS.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/pN3eaCl3sqwrerU8UNdp40F2mK0.jpg'
        ]
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/vUw2VOItNTZfGHSSZWqxstUB8ok.jpg',
        title: 'Humint ',
        year: 2026,
        summary: 'A South Korean agent hunts a drug ring in Russia and goes head-to-head with a North Korean operative — pulling both into peril and tangled secrets..',
        movieDuration: 120,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Zo In-sung', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/69gbyFI0ET0l0dyjKChlx1Zx269.jpg', character: 'Natasha Romanoff'),
          Cast(name: 'Park Jeong-min', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/o0IKTRpUgNILXzWtskyMJM1NG4j.jpg', character: 'Yelena Belova'),
          Cast(name: 'Park Hae-joon', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/heNKjLHWCQXXfkDB1Hb2nhuhDCf.jpg', character: 'Red Guardian'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/aWS8heTW7M989yEg0TArA5tRJDm.jpg'
          'https://media.themoviedb.org/t/p/w500_and_h282_face/4Y45z7PQY3H7gsWFjx13GM4d1x1.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/a7oKOj0qYaaQsy6LxOYWo4Jpt4B.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/3LpwXRR8AhNXgxQBVN4It2ldinU.jpg',
        title: 'Black Panther',
        year: 2018,
        summary: 'T\'Challa returns home to Wakanda to take his place as king, but finds his sovereignty challenged by a powerful enemy from the past.',
        movieDuration: 134,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Chadwick Boseman', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/1lz1wLOuPFSRIratMz0SxD3tkJ.jpg', character: "T'Challa"),
          Cast(name: 'Michael B. Jordan', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/sMBpav8cK7t7Nk0yf4tuNOqNUyW.jpg', character: 'Killmonger'),
          Cast(name: 'Lupita Nyong\'o', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/y40Wu1T742kynOqtwXASc5Qgm49.jpg', character: 'Nakia'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/6ELJEzQJ3Y45HczvreC3dg0GV5R.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/4K92giNstjy4Waz35bAsqt83J1F.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/mjVIlewPMlmTR6PCggsasmaMcac.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/3EhxHFQIZygJT1l4KFpVJ7GIcsg.jpg',
        title: 'Doctor Strange in the Multiverse of Madness',
        year: 2022,
        summary: 'Doctor Strange teams up with a mysterious teenager who can travel between multiverses, facing a powerful enemy determined to destroy them.',
        movieDuration: 126,
        genres: ['Action', 'Adventure', 'Fantasy'],
        cast: [
          Cast(name: 'Benedict Cumberbatch', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/wz3MRiMmoz6b5X3oSzMRC9nLxY1.jpg', character: 'Doctor Strange'),
          Cast(name: 'Elizabeth Olsen', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/wIU675y4dofIDVuhaNWPizJNtep.jpg', character: 'Wanda Maximoff'),
          Cast(name: 'Xochitl Gomez', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/q39DOx44YHrGF1h88R9HxRNZS3.jpg', character: 'America Chavez'),
        ],
        isFav: false,
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/AdyJH8kDm8xT8IKTlgpEC15ny4u.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/dTn1HGhCuq26IoBq9qKsiYNFxfq.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/51wwXoVKpS6oJMbz03qvN0Hxt99.jpg'
        ]
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/gZH6uXguoii3LgvsH7dyGtBZTix.jpg',
        title: 'Doctor Who: The Day of the Doctor',
        year: 2013,
        summary: 'In the 50th anniversary special, the Doctors embark on their greatest adventure in all of time and space to save Gallifrey from destruction.',
        movieDuration: 77,
        genres: ['Adventure', 'Drama', 'Sci-Fi'],
        cast: [
          Cast(name: 'Matt Smith', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/xr2GSp8Pm6fT5VGm0I9tsWVcZ8q.jpg', character: 'The Eleventh Doctor'),
          Cast(name: 'David Tennant', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/pQHLJEOEcKpPpyiIheh47AJ5INS.jpg', character: 'The Tenth Doctor'),
          Cast(name: 'John Hurt', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/bjNSzt1d7uK3q5PbtFXUJrRt4qg.jpg', character: 'The War Doctor'),

        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/tbF57JNof8j3X14GhZtqafkrziU.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/cTlUjRNgZfQxjNskbMJl1sKhIsr.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/po29ds1hY35mSBkK2gpTNUZDsW.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/tphkjmQq8WebuVwNXelmjLUXuPJ.jpg',
        title: 'Godzilla',
        year: 2014,
        summary: 'The world\'s most famous monster is pitted against malevolent creatures who, bolstered by humanity\'s scientific arrogance, threaten our very existence.',
        movieDuration: 123,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Aaron Taylor-Johnson', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/pFtHhih2XEaFaD3qOFyQW6q83br.jpg', character: 'Ford Brody'),
          Cast(name: 'Ken Watanabe', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/w2t30L5Cmr34myAaUobLoSgsLfS.jpg', character: 'Dr. Serizawa'),
          Cast(name: 'Bryan Cranston', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/npIIZJGSrcJIJ6yHdmbqO6Jzo5I.jpg', character: 'Joe Brody'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/cHvwgJPaT59H1HiQsvBrGD5I46g.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/wQAccOlw3W1xyfWSJyfcNDIKInA.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/xJfK97vWl5HZ06kunVrYnuQQMrX.jpg'

        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/36xXlhEpQqVVPuiZhfoQuaY4OlA.jpg',
        title: 'Wednesday',
        year: 2022,
        summary: 'Wednesday Addams investigates a murder spree while making new friends and enemies at Nevermore Academy.',
        movieDuration: 55,
        genres: ['Comedy', 'Crime', 'Fantasy'],
        cast: [
          Cast(name: 'Jenna Ortega', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/dQb6COORkv8liT5FMtXdHuvjUsb.jpg', character: 'Wednesday Addams'),
          Cast(name: 'Gwendoline Christie', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/kmlv5i02n3zKryBr2W3kSeWVKTD.jpg', character: 'Principal Weems'),
          Cast(name: 'Percy Hynes White', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/lY5WDKbqTPI0GGhKwqM2P7bPEX4.jpg', character: 'Xavier Thorpe'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/nPWRN9MDIjO2gDB7nYOPje1pBLu.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/l56gka4kw2R4K7M4hSJRt12M6R6.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/bcCBq9N1EMo3daNIjWJ8kYvrQm6.jpg',
        title: 'Eternals',
        year: 2021,
        summary: 'The saga of the Eternals, a race of immortal beings who lived on Earth for thousands of years, finally comes to light.',
        movieDuration: 157,
        genres: ['Action', 'Adventure', 'Drama'],
        cast: [
          Cast(name: 'Gemma Chan', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/stTKj4iNauhqlVmZ6XAsFsvcMCY.jpg', character: 'Sersi'),
          Cast(name: 'Richard Madden', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/9QQFfVZ6PLe3WVmOL56wGNOnbGL.jpg', character: 'Ikaris'),
          Cast(name: 'Angelina Jolie', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/nXA9vMvskmIDB5NqHCkTQPmemep.jpg', character: 'Thena'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/k2twTjSddgLc1oFFHVibfxp2kQV.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/9dDZIUoDX5NFg25A3r6DrzlJKDE.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/3PbUQVxUgF4FVs6BKpIMwzcALQD.jpg',
        title: 'Joker',
        year: 2019,
        summary: 'A failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming a legendary villain.',
        movieDuration: 122,
        genres: ['Crime', 'Drama', 'Thriller'],
        cast: [
          Cast(name: 'Joaquin Phoenix', image: 'https://media.themoviedb.org/t/p/w500_and_h282_face/hO7KbdvGOtDdeg0W4Y5nKEHeDDh.jpg', character: 'Arthur Fleck / Joker'),
          Cast(name: 'Robert De Niro', image: 'https://media.themoviedb.org/t/p/w500_and_h282_face/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg', character: 'Murray Franklin'),
          Cast(name: 'Zazie Beetz', image: 'https://media.themoviedb.org/t/p/w500_and_h282_face/gZWl93sf8AxavYpVT1Un6EF3oCj.jpg', character: 'Sophie Dumond'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w66_and_h66_face/u38k3hQBDwNX0VA22aQceDp9Iyv.jpg',
          'https://media.themoviedb.org/t/p/w66_and_h66_face/cT8htcckIuyI1Lqwt1CvD02ynTh.jpg',
          'https://media.themoviedb.org/t/p/w66_and_h66_face/sgxzT54GnvgeMnOZgpQQx9csAdd.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath:'https://media.themoviedb.org/t/p/w220_and_h330_face/kwdWTa5wjFGJbFY2mpofgg91xHp.jpg',
        title: 'Iron Man 3',
        year: 2013,
        summary: 'Tony Stark faces a powerful enemy called the Mandarin and must rely on his ingenuity and instincts to protect those he loves.',
        movieDuration: 130,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Robert Downey Jr.', image: AppAssets.movieImage14, character: 'Tony Stark'),
          Cast(name: 'Gwyneth Paltrow', image: AppAssets.movieImage14, character: 'Pepper Potts'),
          Cast(name: 'Ben Kingsley', image: AppAssets.movieImage14, character: 'The Mandarin'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/tKa1gmGKAUVYnflYcadipeL3d9h.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/4TSqtluelcWByj8YZdqwzQVjI0O.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/fmYRqXtoEOwk5VgTnIOgWNDyPeJ.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/jjyuk0edLiW8vOSnlfwWCCLpbh5.jpg',
        title: 'Scream 7 ',
        year: 2026,
        summary: 'Political involvement in the Avengers\' affairs causes a rift between Captain America and Iron Man, leading to an all-out war between heroes.',
        movieDuration: 190,
        genres:['Horror', 'Mystery', 'Thriller'],
        cast: [
          Cast(name: 'Neve Campbell', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/zQzNg6Kiufj2VCltprI6jilNtl3.jpg', character: 'Sidney Evans'),
          Cast(name: 'Courteney Cox', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/cSOORhCRPJiwKghozXVXrOBi3Tp.jpg', character: 'Gale Weathers'),
          Cast(name: 'Isabel May', image:'Isabel May', character: 'Tatum Evans'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/6Gguj3y7mropdvCag7bB6ZZAfHi.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/3eUyLEF5M0ky3h6KJsWiWzaakB8.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/j8rQ07aMf2NS5bOAfMzk3nfjIt6.jpg'
        ],
        isFav: false,
      ),
      MovieDetailModel(
        imagePath: 'https://media.themoviedb.org/t/p/w220_and_h330_face/rFhKkXhk7ClU03jQ5rHIApJDwev.jpg',
        title: 'War Machine',
        year: 2026,
        summary: 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and it is up to the Avengers to stop the villainous Ultron.',
        movieDuration: 141,
        genres: ['Action', 'Adventure', 'Sci-Fi'],
        cast: [
          Cast(name: 'Alan Ritchson', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/92YNEEpCyugkTzPprJwZpvVtvuK.jpg', character: '81'),
          Cast(name: 'Dennis Quaid', image: 'https://media.themoviedb.org/t/p/w66_and_h66_face/lMaDAJHzsKH7U3dln2B3kY3rOhE.jpg', character: 'Army Sgt Maj Sheridan'),
          Cast(name: 'Stephan James', image:'https://media.themoviedb.org/t/p/w66_and_h66_face/itWiVFI7uE8s4QQjcQBbVO0hY7K.jpg', character: '7'),
        ],
        screenShot: [
          'https://media.themoviedb.org/t/p/w500_and_h282_face/6yeVcxFR0j08vlv2OlL6zbewm4D.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/UaPBEvOJs9b2D2XYVTrHg0ti3F.jpg',
          'https://media.themoviedb.org/t/p/w500_and_h282_face/mdQusDes16kcHkDZQqleYCRhiNK.jpg'
        ],
        isFav: false,
      ),
    ];
  }
}