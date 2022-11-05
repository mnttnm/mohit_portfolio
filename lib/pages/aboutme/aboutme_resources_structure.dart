import 'package:mohit_portfolio/resource.dart';

final ResourceTree aboutMeResourceStructure = ResourceTree(
  treeTitle: "about_me",
  treeStructure: [
    Resource(
      type: ResourceType.folder,
      name: "personal",
      children: [
        Resource(
          type: ResourceType.folder,
          name: "education",
          children: [
            Resource(type: ResourceType.file, name: "education_details.md"),
            Resource(type: ResourceType.file, name: "graduation.md"),
            Resource(type: ResourceType.file, name: "senior-secondary.md"),
          ],
        ),
        Resource(
          type: ResourceType.file,
          name: "interests.md",
        ),
        Resource(
          type: ResourceType.file,
          name: "intro.md",
        )
      ],
    ),
    Resource(
      type: ResourceType.folder,
      name: "professional",
      children: [
        Resource(type: ResourceType.file, name: "career_progression.md"),
        Resource(type: ResourceType.file, name: "skills.md"),
        Resource(type: ResourceType.file, name: "achievements.md"),
      ],
    )
  ],
);
