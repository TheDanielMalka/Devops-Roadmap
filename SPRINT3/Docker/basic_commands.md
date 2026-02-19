# --- DAILY WORKFLOW ---
# Build:
docker build -t arena-test .

# Run:
docker run --rm arena-test

# --- EMERGENCY & CLEANUP ---
# Deep clean:
docker system prune -f

# Check running:
docker ps

# Stop all:
docker stop $(docker ps -q)

# Debug Mode:
docker run -it arena-test bash

# --- QUICK TIPS ---
# 1. Use 'opencv-python-headless' in requirements.txt
# 2. Always use '--rm' to save space
# 3. Rebuild after any file change
