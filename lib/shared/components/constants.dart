// https://api.themoviedb.org/3/movie/550?api_key=c135adc1a952e0dd259e0a700415d596
// base url : https://api.themoviedb.org/
// method (url) : 3/movie/550?
// queries :
//api_key = c135adc1a952e0dd259e0a700415d596
//readAccessToken =

void printFullText (String? text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text!).forEach((match)=> print(match.group(0)));
}

String? token = '';