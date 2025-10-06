# 🧠 Commit Agent

A smart AI-powered Git commit message generator for Dart and Flutter projects.  
It automatically analyzes your Git changes (`git diff`) and suggests a clean, concise, and meaningful commit message using OpenAI.

---

## 🚀 Features

✅ Automatically stages and analyzes your code changes  
✅ Generates professional commit messages using OpenAI GPT models  
✅ Interactive CLI — choose commit type and confirm messages  
✅ Works on **Windows**, **macOS**, and **Linux**  
✅ Simple initialization using your OpenAI API key  
✅ Safe to use — requires explicit confirmation before committing  

---

## 🧩 Getting Started

### 🔧 Installation

Add this to your `dev_dependencies` in `pubspec.yaml`:

```yaml

dev_dependencies:
  commit_agent: ^1.0.0

```

Then run:
```base

flutter pub get

```
---

### ⚙️ Initialization

Before using the agent, initialize it with your OpenAI API key in your main script or command:
```dart
import 'package:commit_agent/commit_agent.dart';

void main() {
  // Initialize once with your OpenAI key
  initCommitAgent(openAIKey: 'sk-your-api-key');

  // Run the agent interactively
  runCommitAgent();
}

```

This will:
 1. Stage all changes (git add .)
 2. Ask for commit type (e.g., FEAT, FIX, REFACTOR, etc.)
 3. Optionally take your note
 4. Generate an AI-based commit message
 5. Confirm before committing and pushing 🚀

 ---

### 🧰 Environment Setup

Add your OpenAI API key as an environment variable:

Linux / macOS:
```base
export OPENAI_API_KEY="sk-your-key"
```
Windows PowerShell:
```PowerShell
setx OPENAI_API_KEY "sk-your-key"
```
Then in Dart:
```dart
initCommitAgent(openAIKey: Platform.environment['OPENAI_API_KEY']!);
```

---

### 🧾 License

This project is licensed under the MIT License — feel free to use it in personal and commercial projects.

Copyright (c) 2025 Rohan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...


