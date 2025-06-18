FROM tensorflow/serving:latest

# Copy model dan config ke dalam container
COPY ./output/serving_model /models/hd-model
COPY ./config /model_config

# Set environment variabel 
ENV MODEL_NAME=hd-model
ENV MODEL_BASE_PATH=/models
ENV MONITORING_CONFIG_FILE=/model_config/prometheus.config

# Custom entrypoint untuk menjalankan TensorFlow Serving dengan monitoring
RUN echo '#!/bin/bash \n\n\
echo "Starting TensorFlow Serving with monitoring..." \n\
echo "MODEL_NAME: ${MODEL_NAME}" \n\
echo "MODEL_BASE_PATH: ${MODEL_BASE_PATH}" \n\
echo "PORT: ${PORT}" \n\
echo "MONITORING_CONFIG_FILE: ${MONITORING_CONFIG_FILE}" \n\n\
# Default port jika tidak ada PORT environment variable \n\
if [ -z "${PORT}" ]; then \n\
  export PORT=8501 \n\
fi \n\n\
tensorflow_model_server \
  --port=8500 \
  --rest_api_port=${PORT} \
  --model_name=${MODEL_NAME} \
  --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
  --monitoring_config_file=${MONITORING_CONFIG_FILE} \
  --allow_version_labels_for_unavailable_models=true \
  "$@"' > /usr/bin/tf_serving_entrypoint.sh \
&& chmod +x /usr/bin/tf_serving_entrypoint.sh

# Expose ports
EXPOSE 8500 8501

ENTRYPOINT ["/usr/bin/tf_serving_entrypoint.sh"]