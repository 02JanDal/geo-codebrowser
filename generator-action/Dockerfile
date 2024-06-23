FROM ubuntu:24.04 AS build

RUN apt update && \
    apt install -y --no-install-recommends cmake llvm-15 clang-15 libclang-15-dev llvm-15-dev ninja-build wget unzip ca-certificates
ENV CC=/usr/bin/clang-15 CXX=/usr/bin/clang++-15

WORKDIR /work
RUN wget https://github.com/KDAB/codebrowser/archive/refs/heads/master.zip && unzip master.zip
WORKDIR /work/codebrowser-master/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -G Ninja .. && cmake --build . --parallel 2

FROM ubuntu:24.04

COPY --from=build /work/codebrowser-master/build/generator/codebrowser_generator /
COPY --from=build /work/codebrowser-master/build/indexgenerator/codebrowser_indexgenerator /

COPY entrypoint.sh /
ENTRYPOINT ["bash", "/entrypoint.sh"]
