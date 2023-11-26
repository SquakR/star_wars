import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:star_wars/models/models.dart';

class CharacterListTile extends StatelessWidget {
  final Character character;
  final Widget trailing;

  const CharacterListTile({
    super.key,
    required this.character,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        title: Text(character.name),
        subtitle: Text(
          AppLocalizations.of(context)!
              .starshipNumber(character.starshipUris.length),
        ),
        leading: switch (character.gender) {
          Gender.male => const Icon(Icons.face),
          Gender.female => const Icon(Icons.face_3),
          Gender.hermaphrodite => const Icon(Icons.face_2),
        },
        trailing: trailing,
      ),
    );
  }
}
