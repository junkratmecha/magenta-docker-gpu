1.notesequence作成
convert_dir_to_note_sequences \
--input_dir=/data/input/junk \
--output_file=/data/tmp/notesequences.tfrecord \
--recursive

2.dataset作成
melody_rnn_create_dataset \
--config=lookback_rnn \
--input=/data/tmp/notesequences.tfrecord \
--output_dir=/data/set \
--eval_ratio=0.2

3.学習
melody_rnn_train \
--config=lookback_rnn \
--run_dir=/data/logdir/run4 \
--sequence_example_file=/data/set/training_melodies.tfrecord \
--hparams="batch_size=4,rnn_layer_sizes=[64,64]" \
--num_training_steps=1000

4.mag作成
melody_rnn_generate \
--config=lookback_rnn \
--run_dir=/data/logdir/run4 \
--hparams="batch_size=4,rnn_layer_sizes=[64,64]" \
--bundle_file=/data/mag/junk_lookback_rnn.mag \
--save_generator_bundle

5.音楽作成
melody_rnn_generate \
--config=attention_rnn \
--bundle_file=/data/mag/junk_attention_rnn.mag \
--output_dir=/data/output \
--num_outputs=5 \
--num_steps=96
* \
--primer_melody="[60]"


