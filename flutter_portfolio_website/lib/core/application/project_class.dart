class Project {
  final String title;
  final String shortTitle;
  final List<String> techStackCategories;
  final List<String> languageCategories;
  final List<String> projectTypeCategories;
  final String description;
  final String? additionalInfo;
  final DateTime date;
  final String? githubLink;
  final String? prototypeLink1;
  final String? prototypeLink2;
  final String? futureWork;
  final List<String> listOfImagePaths;

  Project(this.title, this.shortTitle, this.techStackCategories, this.languageCategories, this.projectTypeCategories, this.description, this.additionalInfo, this.date, this.githubLink, this.prototypeLink1, this.prototypeLink2, this.futureWork, this.listOfImagePaths);
}