FROM mybigpai-registry.cn-beijing.cr.aliyuncs.com/aigc/sd-webui-easyphoto:0.0.3 as build_final_image

# Install Python dependencies (Worker Template)
COPY builder/requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade -r /requirements.txt --no-cache-dir -i  https://pypi.tuna.tsinghua.edu.cn/simple  && \
    rm /requirements.txt

ADD src .

# Cleanup section (Worker Template)
RUN apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

# Set permissions and specify the command to run
RUN chmod +x /workspace/start.sh
CMD /workspace/start.sh
