import * as vscode from "vscode";
import * as path from "path";

export function activate(context: vscode.ExtensionContext) {
  const onSaveDisposable = vscode.workspace.onWillSaveTextDocument(
    async (event) => {
      const editor = vscode.window.activeTextEditor;
      if (!editor || editor.document !== event.document) {
        return;
      }

      const filePath = editor.document.fileName;
      if (!filePath.match(/\.(tsx|jsx|ts|js)$/)) {
        return;
      }

      const moduleExtensions = [
        "module.css",
        "module.scss",
        "module.less",
        "module.styl",
      ];
      let importStatement = "";

      for (const ext of moduleExtensions) {
        const modulePath = filePath.replace(/\.(tsx|jsx|ts|js)$/, `.${ext}`);
        const moduleName = path.basename(modulePath);

        if (editor.document.getText().includes(moduleName)) {
          return; // Module is already imported
        }

        try {
          await vscode.workspace.fs.stat(vscode.Uri.file(modulePath));
          importStatement = `import style from './${moduleName}';\n`;
          break;
        } catch {
          continue;
        }
      }

      if (!importStatement) {
        return;
      }

      editor.edit((editBuilder) => {
        editBuilder.insert(new vscode.Position(0, 0), importStatement);
      });
    }
  );

  context.subscriptions.push(onSaveDisposable);
}

export function deactivate() {}
