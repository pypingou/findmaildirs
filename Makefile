CC?=		gcc
CFLAGS?=	# empty
CFLAGS+=	-Wall -Wextra

DESTDIR?=	# empty
PREFIX?=	/usr/local

PROGRAM=	findmaildirs
SOURCES=	findmaildirs.c

# for compatibility with FreeBSD ports
BSD_INSTALL_PROGRAM?=	install -s -m 555

all: ${PROGRAM}

${PROGRAM}: ${SOURCES}
	${CC} ${CFLAGS} ${SOURCES} -o ${PROGRAM}

clean:
	rm -f ${PROGRAM}

install: ${PROGRAM}
	mkdir -p ${DESTDIR}${PREFIX}/bin
	${BSD_INSTALL_PROGRAM} ${PROGRAM} ${DESTDIR}${PREFIX}/bin/
