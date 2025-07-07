#!/bin/bash
# Setup script for AI-Powered Analytics Project

echo "🚀 Setting up AI-Powered Analytics Project..."

# Create virtual environment
echo "📦 Creating virtual environment..."
python -m venv venv

# Activate virtual environment
echo "🔧 Activating virtual environment..."
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

# Upgrade pip
echo "⬆️ Upgrading pip..."
python -m pip install --upgrade pip

# Install requirements
echo "📥 Installing dependencies..."
pip install -r requirements.txt

# Download NLTK data
echo "📚 Downloading NLTK data..."
python -c "import nltk; nltk.download('punkt'); nltk.download('stopwords'); nltk.download('wordnet')"

# Create necessary directories
echo "📁 Creating project directories..."
mkdir -p data/{raw,processed}
mkdir -p results/{models,figures}
mkdir -p logs

# Download GloVe embeddings (optional - large file)
echo ""
echo "❓ Would you like to download GloVe embeddings (862MB)? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "📥 Downloading GloVe embeddings..."
    cd data
    wget http://nlp.stanford.edu/data/glove.6B.zip
    unzip glove.6B.zip
    cd ..
else
    echo "⏭️ Skipping GloVe download. You'll need to download it manually for Part 2."
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "🎯 Next steps:"
echo "1. Activate the virtual environment: source venv/bin/activate"
echo "2. Run the demo: python demo.py"
echo "3. Or explore the notebooks: jupyter notebook"
echo ""
echo "📖 Check out the README.md for more information!"