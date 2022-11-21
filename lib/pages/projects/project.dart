enum TechStack { flutter, react, python, typescript, javascript, dart }

class Project {
  final String title;
  final List<TechStack>? techStackUsed;
  final List<String>? highlights;
  final String projectDescription;
  final String? githubLink;
  final String? liveProjectLink;
  final String? thumbnail;
  final String id;

  const Project({
    required this.id,
    required this.title,
    this.techStackUsed,
    required this.projectDescription,
    this.githubLink,
    this.liveProjectLink,
    this.thumbnail,
    this.highlights,
  });
}
