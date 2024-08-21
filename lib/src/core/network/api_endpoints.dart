class ApiEndpoints{
   static  const String _baseUrl= "https://newsapi.org/";
   static const String _apiKey="5e43308aa29444d5802a838943259116";


  static String get trendingNewsApi=>"${_baseUrl}v2/top-headlines?sources=techcrunch&apiKey=$_apiKey";
  static String get newsForYouApi=>"${_baseUrl}v2/top-headlines?sources=techcrunch&apiKey=$_apiKey";
  static String get appleNewsApi=>"${_baseUrl}v2/everything?q=apple&from=2024-08-17&to=2024-08-17&sortBy=popularity&apiKey=$_apiKey";
  static String get teslaNewsApi=>"${_baseUrl}v2/everything?q=tesla&from=2024-07-18&sortBy=publishedAt&apiKey=$_apiKey";
  static String get businessNewsApi=>"${_baseUrl}v2/top-headlines?country=us&category=business&apiKey=$_apiKey";
  static String get techCrunchNewsApi=>"${_baseUrl}v2/top-headlines?sources=techcrunch&apiKey=$_apiKey";

  static String  searchNewsApi({required String search})=>"${_baseUrl}v2/top-headlines?q=$search&apiKey=$_apiKey";

}