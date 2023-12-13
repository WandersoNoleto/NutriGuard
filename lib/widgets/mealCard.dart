import 'package:flutter/material.dart';
import 'package:nutri_guard/colors/colors.dart';

class MealCard extends StatefulWidget {
  final String label;
  final VoidCallback onDelete;

  const MealCard({Key? key, required this.label, required this.onDelete})
      : super(key: key);

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              enabled: _isEditing,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 8.0),
              ),
            ),
          ),
          IconButton(
            icon: _isEditing
                ? Icon(Icons.save, color: Colors.white)
                : Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              widget.onDelete(); // Chama a função onDelete ao clicar no ícone de exclusão
            },
          ),
        ],
      ),
    );
  }
}
