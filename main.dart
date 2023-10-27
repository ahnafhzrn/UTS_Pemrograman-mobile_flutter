import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icinema',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/image': (context) => ImagePage(),
        '/film_list': (context) => FilmListPage(),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I Cinema'),
        backgroundColor: Colors.cyan, // Ubah warna AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 24.0, // Ubah ukuran teks sesuai kebutuhan
                fontWeight:
                    FontWeight.bold, // Atur ketebalan teks jika diperlukan
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Validasi login di sini (contoh sederhana)
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'password') {
                  Navigator.pushNamed(context, '/image');
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Failed'),
                        content: Text(
                            'Invalid username or password. Please try again.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        backgroundColor: Colors.grey[700], // Ubah warna AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Beranda'),
              onTap: () {
                Navigator.pop(context); // Tutup Drawer
                Navigator.pushNamed(context, '/image');
              },
            ),
            ListTile(
              title: Text('film list'),
              onTap: () {
                Navigator.pop(context); // Tutup Drawer
                Navigator.pushNamed(context, '/film_list');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Image.network(
          'https://cdn.pixabay.com/photo/2015/12/09/17/12/popcorn-1085072_1280.jpg', // Ganti dengan URL gambar dari internet
          width: 800, // Atur lebar gambar
          height: 500, // Atur tinggi gambar
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Text('Failed to load image');
          },
        ),
      ),
    );
  }
}

class FilmListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Film List'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('The wolf Of Wall Street'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmPage(
                    filmTitle: 'The Wolf Of Wall Street',
                    imageUrl:
                        'https://imgc.allpostersimages.com/img/posters/the-wolf-of-wall-street_u-L-F6D1OA0.jpg',
                    description:
                        'The Wolf of Wall Street adalah film biografi komedi kejahatan Amerika Serikat tahun 2013 yang disutradarai oleh Martin Scorsese dan diproduseri oleh Martin Scorsese, Leonardo DiCaprio, Riza Aziz, Joey McFarland dan Emma Tillinger Koskoff. Naskah film ini ditulis oleh Terence Winter berdasarkan buku The Wolf of Wall Street karya Jordan Belfort. Film ini dibintangi oleh Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew McConaughey, Kyle Chandler, Rob Reiner, Jon Bernthal, Jon Favreau dan Jean Dujardin. Film The Wolf of Wall Street ditayangkan secara perdana di Teater Ziegfeld pada tanggal 17 Desember 2013[3] dan dirilis di Amerika Serikat pada tanggal 25 Desember 2013.[4] Film ini mendapatkan ulasan rata-rata dari para kritikus.', // Deskripsi untuk Film 1
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Dont look up'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmPage(
                    filmTitle: 'Dont look up',
                    imageUrl:
                        'https://foto.kontan.co.id/8YMWqVPKUoNxsLX3RyEcbWqQa8M=/smart/2021/11/17/1214644885p.jpg',
                    description:
                        'Dont Look Up adalah sebuah film komedi gelap fiksi ilmiah satir Amerika Serikat yang ditulis, diproduksi dan disutradarai oleh Adam McKay serta menampilkan Leonardo DiCaprio dan Jennifer Lawrence sebagai dua astronom tingkat rendah yang berupaya memperingatkan umat manusia soal kedatangan komet yang akan menghancurkan Bumi melalui tur media. Film tersebut juga menampilkan Rob Morgan, Jonah Hill, Mark Rylance, Tyler Perry, Ron Perlman, Timothée Chalamet, Ariana Grande, Scott Mescudi, Chris Evans, Cate Blanchett, dan Meryl Streep.', // Deskripsi untuk Film 2
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Titanic'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailFilmPage(
                    filmTitle: 'Titanic',
                    imageUrl:
                        'https://m.media-amazon.com/images/I/51Ev8Mn6RdL.jpg',
                    description:
                        'Titanic adalah sebuah film epik, roman, dan bencana Amerika Serikat produksi tahun 1997 yang diskenarioi sekaligus disutradarai oleh James Cameron. Film ini bercerita tentang kisah cinta antara Jack dan Rose (diperankan oleh Leonardo DiCaprio dan Kate Winslet) yang berasal dari status sosial berbeda di atas kapal RMS Titanic yang tenggelam dalam pelayaran perdananya pada tanggal 15 April 1912.', // Deskripsi untuk Film 3
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DetailFilmPage extends StatelessWidget {
  final String filmTitle;
  final String imageUrl;
  final String description; // Tambahkan variabel description

  DetailFilmPage({
    required this.filmTitle,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Film'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Judul Film: $filmTitle',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              imageUrl,
              width: 500,
              height: 400,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  );
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Text('Failed to load image');
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi: $description', // Tampilkan deskripsi di sini
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
