# 🇨🇭 swiss knife of cairo tools
# - scarb
# - katana
# - starkli
# - 

# base image 🖼️
FROM ubuntu:20.04

# install scarb 📦️
RUN curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh 
    
# install katana 
RUN mkdir ~/.dojo 
RUN cd ~/.dojo

RUN curl -o git.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.26.2.tar.gz

RUN git clone https://github.com/dojoengine/dojo 
RUN cd dojo

# install rust 🦀
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN source ~/.bashrc 
RUN cargo install --path ./crates/katana --locked --force

# install starkli 🔨
RUN curl https://get.starkli.sh | sh
RUN source ~/.bashrc 
RUN starkliup

# generate new keystore 🔑
RUN starkli signer keystore new ~/keystore.json 
RUN export STARKNET_KEYSTORE="~/keystore.json"
RUN starkli signer keystore from-key STARKNET_KEYSTORE