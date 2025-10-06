# 🧠 Commit Agent

A smart AI-powered Git commit message generator for Dart and Flutter projects.  
It automatically analyzes your Git changes (`git diff`) and suggests a clean, concise, and meaningful commit message using OpenAI.

---

## 🚀 Features

✅ Automatically stages and analyzes your code changes  
✅ Generates professional commit messages using OpenAI GPT models  
✅ Interactive CLI — choose commit type and confirm messages  
✅ Works on **Windows**, **macOS**, and **Linux**  
✅ No manual initialization required in CI/CD environments  
✅ Safe to use — requires explicit confirmation before committing  

---

## 🧩 Getting Started

### 🔧 Installation

Add this to your `dev_dependencies` in your `pubspec.yaml`:

```yaml
dev_dependencies:
  commit_agent: ^1.0.0
````

Then run:

```bash
flutter pub get
```

---

### ⚙️ Running the Commit Agent

Now that CI/CD handles initialization, you only need to **set your OpenAI API key** and run the CLI command.

1. **Set your OpenAI API key as an environment variable**

#### Linux / macOS:

```bash
export OPENAI_API_KEY="sk-your-key"
```

#### Windows PowerShell:

```powershell
setx OPENAI_API_KEY "sk-your-key"
```

2. **Run the Commit Agent**

```bash
dart run commit_agent
```

The agent will:

1. Stage all changes (`git add .`)
2. Ask for the commit type (e.g., FEAT, FIX, REFACTOR, DOCS, etc.)
3. Optionally take your note
4. Generate an AI-based commit message
5. Ask for confirmation before committing and pushing 🚀

---

### 🧰 Example Output

```
✅ All changes staged.
Select commit type:
1. FEAT
2. FIX
3. CHORE
4. REFACTOR
5. DOCS
6. TEST
7. STYLE
8. BUG

Enter choice: 1
📝 Optional note: Added login validation

🧠 Suggested commit message:
[FEAT] Improve login validation flow with error handling

Proceed? (y/n): y
🚀 Commit created & pushed successfully!
```

---

### 🏗 CI/CD Integration

Since CI/CD pipelines now handle **initialization**, you don’t need to call `initCommitAgent()` manually.
Just make sure the environment variable `OPENAI_API_KEY` is available in your CI/CD runner before running:

```bash
dart run commit_agent
```

---

### 🧾 License

This project is licensed under the **MIT License** — feel free to use it in personal and commercial projects.

```
Copyright (c) 2025 Rohan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
```

---

### 🧑‍💻 Author

**Rohan Kumar Chaudhary (@rohan-165)**
📧 [rohanchy165@gmail.com](mailto:rohanchy165@gmail.com)
💻 [GitHub](https://github.com/rohan-165)

> 💬 *“Let your commits tell a story — not just a change.”*


