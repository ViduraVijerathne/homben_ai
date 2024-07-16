class Appresultmodel{
  int id;
  String image;
  String name;
  Appresultmodel({required this.id,required this.name,required this.image});

  static Appresultmodel getData(int id){
    if(id == 0 ){
      return Appresultmodel(id: id, name: "MR. Ranasinghe Premadasa", image: "assets/rane.png");
    }else if(id == 1){
      return Appresultmodel(id: id, name: " ශිරන්ති දොණි ❤️", image: "assets/sira.png");
    }else if(id == 2){
      return Appresultmodel(id: id, name: "MR. Ranasinghe Premadasa", image: "assets/rane.png");

    }else {
      return Appresultmodel(id: id, name: "MR. Esmond Wickremesinghe", image: "assets/esmond.png");

    }

  }
}