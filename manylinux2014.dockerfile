FROM quay.io/pypa/manylinux2014_x86_64:latest

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH /root/.cargo/bin:$PATH
RUN /opt/python/cp39-cp39/bin/pip install maturin

RUN mkdir /tmp/src
WORKDIR /tmp/src
COPY build_or_release.sh /tmp
RUN chmod +x /tmp/build_or_release.sh
CMD ["/tmp/build_or_release.sh"]
