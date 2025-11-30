FROM qwen-code-base
COPY init-firewall.sh /usr/local/bin/
USER root
RUN  mkdir -p /etc/sudoers.d && \
    chmod +x /usr/local/bin/init-firewall.sh && \
    echo "node ALL=(root) NOPASSWD: /usr/local/bin/init-firewall.sh" > /etc/sudoers.d/node-firewall && \
    chmod 0440 /etc/sudoers.d/node-firewall


USER node
# Default entrypoint when none specified
CMD ["qwen"]