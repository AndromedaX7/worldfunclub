
extension StringExtension on String{
    int get integer => int.parse(this);
    double get d =>double.parse(this);
}

bool isEmpty(String text){
     return text ==null || text.isEmpty;
}