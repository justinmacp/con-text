#!/bin/bash

# need to run this command:
# xattr -d com.apple.quarantine demo.sh
# if following error occurs:
# -bash: ./demo.sh: /bin/bash: bad interpreter: Operation not permitted

make
if [ ! -e text8 ]; then
if hash wget 2>/dev/null; then
wget http://mattmahoney.net/dc/text8.zip
else
curl -O http://mattmahoney.net/dc/text8.zip
fi
unzip text8.zip
rm text8.zip
fi

CORPUS=Pre_Post_Processing/text8.txt
VOCAB_FILE=vocab.txt
COOCCURRENCE_FILE=cooccurrence.bin
COOCCURRENCE_SHUF_FILE=cooccurrence.shuf.bin
BUILDDIR=Pre_Post_Processing/build
SAVE_FILE=vectors
VERBOSE=2
MEMORY=4.0
VOCAB_MIN_COUNT=5
VECTOR_SIZE=300
MAX_ITER=100
WINDOW_SIZE=10
BINARY=2
NUM_THREADS=8
X_MAX=100

# Preprocessing
#python main.py

$BUILDDIR/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > $VOCAB_FILE
if [[ $? -eq 0 ]]
then
$BUILDDIR/cooccur -memory $MEMORY -vocab-file $VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE < $CORPUS > $COOCCURRENCE_FILE
if [[ $? -eq 0 ]]
then
$BUILDDIR/shuffle -memory $MEMORY -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE
if [[ $? -eq 0 ]]
then
$BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file $VOCAB_FILE -verbose $VERBOSE
#if [[ $? -eq 0 ]]
#then
#if [ "$1" = 'matlab' ]; then
# matlab -nodisplay -nodesktop -nojvm -nosplash < ./eval/matlab/read_and_evaluate.m 1>&2
#elif [ "$1" = 'octave' ]; then
# octave < ./eval/octave/read_and_evaluate_octave.m 1>&2
#else
# python eval/python/evaluate.py
#fi
#fi
fi
fi
fi

# Post Processing Stage
python post_glove.py

#Stanford Dependency Tree
#python client.py
