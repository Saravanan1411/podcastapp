
class PodcastDetailsDataModel {
  String? title;
  String? author;
  String? bannerImage;
  String? description;
  String? duration;
  String? song;


  PodcastDetailsDataModel(this.title,this.author, this.bannerImage, this.duration, this.description,this.song);

}

List<PodcastDetailsDataModel> podcastDataModelList = podcastDetails.map((e) => PodcastDetailsDataModel(e["title"], e['author'],e["bannerImage"],e["duration"],e["description"],e['song'])).toList();

var podcastDetails = [
  {
    'title':'Major Concepts in flutter',
    'author':'Aravind',
    'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },
  {
    'title':'Major Concepts in react',
    'author':'Sri',
    'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },
  {
    'title':'Major Concepts in flutter',
    'author':'Saran',
    'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },
  {
    'title':'Major Concepts in react',
    'author':'Aravind',
    'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },
  {
    'title':'Major Concepts in flutter',
    'author':'Sri',
    'bannerImage':'https://yt3.googleusercontent.com/ytc/APkrFKaD8t4oFlgXcZKoW512Z81CBJuej3K9uHAlSI0x=s900-c-k-c0x00ffffff-no-rj',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },
  {
    'title':'Major Concepts in react',
    'author':'Aravind',
    'bannerImage':'https://www.freecodecamp.org/news/content/images/2021/06/Ekran-Resmi-2019-11-18-18.08.13.png',
    'description':'A overview of flutter',
    'duration':'2m 45s',
    'song': 'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3',
  },

];






