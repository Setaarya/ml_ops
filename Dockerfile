FROM tensorflow/serving:latest

# Copy model ke dalam container
COPY ./output/serving_model /models/hd-model

# Set environment variabel
ENV MODEL_NAME=hd-model
ENV PORT=8501
ENV MODEL_BASE_PATH=/models

# Custom entrypoint untuk menjalankan TensorFlow Serving
RUN echo '#!/bin/bash \n\n\
env \n\
tensorflow_model_server --port=8500 --rest_api_port=${PORT} \
--model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
"$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

ENTRYPOINT ["/usr/bin/tf_serving_entrypoint.sh"]
