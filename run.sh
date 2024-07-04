#!/bin/bash

ENV_NAME="llm_apitest"
REQUIREMENTS_FILE="requirements.txt"
PYTHON_SCRIPT="0_Playground.py"

# 检查conda环境是否已经存在
if conda info --envs | grep "${ENV_NAME}" > /dev/null; then
    echo "Activating environment ${ENV_NAME}"
    conda activate "${ENV_NAME}"
else
    echo "Creating environment ${ENV_NAME}"
    conda create --name "${ENV_NAME}" python=3.10 -y
    conda activate "${ENV_NAME}"

    if [ -f "${REQUIREMENTS_FILE}" ]; then
        pip install -r "${REQUIREMENTS_FILE}"
    fi
fi

# 运行Python脚本
streamlit run "${PYTHON_SCRIPT}" "$@"
