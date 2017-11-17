FROM kbobrowski/docker-deep-learning-essentials

RUN apt-get update && apt install -y \
        zsh \
        sudo \
        vim

RUN useradd --create-home --shell /bin/zsh docker \
    && echo 'docker:d' | chpasswd \
    && adduser docker sudo

RUN git clone git://github.com/robbyrussell/oh-my-zsh.git /home/docker/.oh-my-zsh \
    && cp /home/docker/.oh-my-zsh/templates/zshrc.zsh-template /home/docker/.zshrc

# pure prompt
RUN cd / \
    && git clone https://github.com/sindresorhus/pure.git \
    && cd pure \
    && ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup \
    && ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async \
    && sed -i 's/\"robbyrussell\"/\"\"/g' /home/docker/.zshrc \
    && echo 'autoload -U promptinit; promptinit' >> /home/docker/.zshrc \
    && echo 'prompt pure' >> /home/docker/.zshrc \
    && echo 'PROMPT="(tsh) "$PROMPT' >> /home/docker/.zshrc \
    && echo 'export EDITOR=vim' >> /home/docker/.zshrc \
    && echo 'alias python=python3' >> /home/docker/.zshrc \
    && echo 'alias pip=pip3' >> /home/docker/.zshrc

RUN chown docker:docker /home/docker/.zshrc 
RUN chown -R docker:docker /home/docker/.oh-my-zsh
WORKDIR /home/docker/mount
USER docker

ENTRYPOINT zsh
