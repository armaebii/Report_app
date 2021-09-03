class ListItem {
  final String title;
  final String location;
  final String urlImage;
  final String timein;
  final String timeout;

  const ListItem({
  required this.title, 
  required this.location,
  required this.urlImage,
  required this.timein,
  required this.timeout,
});
}

class Period{
  final int id;
  final String period;

  const Period({
    required this.id,
    required this.period,
  });
}
