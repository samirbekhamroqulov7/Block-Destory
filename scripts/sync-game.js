const fs = require('fs');
const path = require('path');

const gameEngineFiles = [
  'gameEngine.js',
  'app/page.tsx',
  'components/ui',
  'lib/utils.ts'
];

function copyFile(source, target) {
  const sourcePath = path.join(__dirname, '..', source);
  const targetPath = path.join(__dirname, '..', target);
  
  if (fs.existsSync(sourcePath)) {
    if (fs.lstatSync(sourcePath).isDirectory()) {
      copyDirectory(sourcePath, targetPath);
    } else {
      fs.copyFileSync(sourcePath, targetPath);
      console.log(`✓ Copied ${source} to ${target}`);
    }
  }
}

function copyDirectory(source, target) {
  if (!fs.existsSync(target)) {
    fs.mkdirSync(target, { recursive: true });
  }
  
  const files = fs.readdirSync(source);
  files.forEach(file => {
    const sourceFile = path.join(source, file);
    const targetFile = path.join(target, file);
    
    if (fs.lstatSync(sourceFile).isDirectory()) {
      copyDirectory(sourceFile, targetFile);
    } else {
      fs.copyFileSync(sourceFile, targetFile);
    }
  });
}

// Копирование игровой логики
fs.copyFileSync(
  path.join(__dirname, '..', 'gameEngine.js'),
  path.join(__dirname, '..', 'packages/game-engine/index.js')
);

// Копирование в apps/web
fs.copyFileSync(
  path.join(__dirname, '..', 'gameEngine.js'),
  path.join(__dirname, '..', 'apps/web/gameEngine.js')
);

// Копирование в apps/desktop
fs.copyFileSync(
  path.join(__dirname, '..', 'gameEngine.js'),
  path.join(__dirname, '..', 'apps/desktop/gameEngine.js')
);

// Копирование в apps/mobile
fs.copyFileSync(
  path.join(__dirname, '..', 'gameEngine.js'),
  path.join(__dirname, '..', 'apps/mobile/gameEngine.js')
);

console.log('Game engine synchronized across all platforms!');