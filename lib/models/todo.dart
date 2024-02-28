class Todo {
  /// 各Todoのデータ構造を定義
  int id; // 一意の識別子
  String title; // タイトル
  bool isCompleted; // 完了状態

  /// Todoクラスのコントラクタ
  Todo({
    required this.id, // 必須
    required this.title, // 必須
    this.isCompleted = false // 必須ではない
  });

  /// Todoの完了状態を切り替え
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  /// JSONからTodoオブジェクトを生成
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  /// TodoオブジェクトをJSONに変換
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
