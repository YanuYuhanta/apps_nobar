import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //widge title section berguna untuk mengatur judul dari detail film dengan menggunakan container
    Widget titleSection = Container(
      //padding mengatur jarak tinggi dan lebar container
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*atribut coloumn berfungsi sebagai landasan dari content title*/
            child: Column(
              // crossAxisAlignment berfungsi untuk mengatur posisi content
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*2*/
                Container(
                  child: const Text(
                    'Iron Man',
                    //text style berfungsi memodifikasi teks yang ditulis seperti ukuran, jenis font, dll
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //widget sinopsis berfungsi untuk membuat penjelasan dari film untuk kerangkanya masih sama dengan widget title
    Widget sinopsisSection = Container(
      padding: const EdgeInsets.all(32),
      child:Row(
        children: [
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: const Text(
                    'Sinopsis',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                const Text(
                  'Tony Stark adalah seorang jenius, miliarder, dan pengusaha sukses yang membuat senjata canggih untuk perusahaan miliknya, Stark Industries. Namun, saat Tony diculik oleh kelompok teroris, ia menemukan bahwa senjata buatannya digunakan untuk membunuh orang tak bersalah. Tony memutuskan untuk mengubah hidupnya dan menggunakan keahliannya untuk membuat baju besi yang membuatnya menjadi Iron Man, seorang pahlawan super yang melindungi dunia dari bahaya.'
                      'Dalam film ini, Tony Stark harus melawan musuh bebuyutannya, Obadiah Stane, yang telah mengkhianatinya dan mencoba mengambil alih perusahaan miliknya. Tony juga harus menghadapi dilema moral saat ia menyadari dampak buruk dari senjata yang pernah ia buat. Selain itu, ia juga harus mempertahankan identitas rahasianya sebagai Iron Man dari musuh-musuhnya dan orang-orang di sekitarnya.',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
    //Widget detailImageSection berfungsi untuk mengatur gambar dari cast film
    Widget detailImageSection = Container(
      padding: const EdgeInsets.only(top: 32,left: 32,right: 32,bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: const Text(
              'Pemeran ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900
              ),
            ),
          ),
          Container(
            child:Row(
              children: [
                Expanded(
                  //pada kode dibawah terdapat atribute row yang befungsi mengubah tata letak content dari vertikal menjadi horizontal
                  child: Row(
                    //berbeda dengan coloumn yang menggunakan crossAxis untuk mengubah posisi content pada Row untuk mengubah posisi content menggunakan mainAxisAlignment
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: 150,
                        height: 150,
                        //atribut Image digunakan untuk memuat gambar pada halaman
                        child: const Image(
                          image: AssetImage('image/cast1.jpg'),
                          //atribut fit digunakan untuk mengatur ukuran gambar dengan patokan container
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        width: 150,
                        height: 150,
                        child: const Image(
                          image: AssetImage('image/cast2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
    //Widget detailTeksSection berfungsi membuat nama dibawah image pemeran
    Widget detaiTeksSection = Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 25),
            child: const Text(
              'Robert Downey J',
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          const Text(
            'Gwyneth Kate Paltrow',
            style: TextStyle(
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
    //Widget UrlSection berfungsi untuk menunjukan url untuk menonton film yang dijelaskan
    Widget urlSection = Container(
        child: Row(
          children: [
            Expanded(
                child: Container(
                  height:100,
                  width:double.infinity,
                  color: Colors.redAccent[50],
                  child: Center(
                    //Widget ElevatedButton pada Flutter dapat membantu kita untuk membuat sebuah button yang menarik yang dapat dijadikan sebagai Button CTA (Call to Action) pada aplikasi
                      child: ElevatedButton(
                        child: const Text("Open Disney+"),
                        onPressed: () async {
                          //kode dibawah berfungsi mengarahkan button ke url yang telah ditentukan.
                          String url = "https://www.hotstar.com/id/movies/iron-man/1660000038";
                          var urllaunchable = await canLaunch(url); //canLaunch berasal dari paket url_launcher
                          if(urllaunchable){
                            await launch(url); //peluncuran dari paket url_launcher ke URL peluncuran
                          }else{
                            print("URL can't be launched.");
                          }
                          },
                      )
                  ),
                )
            )
          ],
        ),
    );
    //material app berfungsi untuk menjalankan aplikasi yang dibuat
    return MaterialApp(
      title: 'Nobar',
      //kode dibawah untuk menghilangkan tanda debug pada samping kanan
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nobar'),
        ),
        //list view digunakan untuk mengurutkan posisi content
        body: ListView(
          children: [
            Image.asset(
              'image/banner2.jpg',
              width: 600,
              height: 340,
              fit: BoxFit.cover,
            ),
            titleSection,
            sinopsisSection,
            detailImageSection,
            detaiTeksSection,
            urlSection
          ],
        ),
      ),
    );
  }
}


