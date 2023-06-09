#CUDA_VISIBLE_DEVICES=... python3 -m torch.distributed.launch \
python3 -m torch.distributed.launch \
        --nproc_per_node 6 train.py \
        --model_path="bigcode/santacoder" \
        --model_revision="main" \
        --dataset_name="bigcode/starcoderdata" \
        --subset="lua" \
        --data_column "content" \
        --split="train" \
        --output_dir="./model_normal" \
        --seq_length 2048 \
        --max_steps 16000 \
        --batch_size 16 \
        --gradient_accumulation_steps 1 \
        --learning_rate 5e-5 \
        --num_warmup_steps 100 \
        --eval_freq 500 \
        --save_freq 5000 \
        --streaming \
        --log_freq 1 \
        --num_workers=$(expr $(nproc --all) - 4) \
        --no_fp16 \
        --bf16 \
        # --hub_model_id="TODO" \
        # --push_to_hub \
        #--checkpoint "chk/last-checkpoint"
