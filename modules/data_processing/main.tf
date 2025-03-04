# # Tu código ya está utilizando AWS Lambda para procesar datos en tiempo real desde un stream de Kinesis. Aquí tienes una descripción detallada de lo que hace cada recurso en tu archivo `main.tf`:

# # 2. **Stream de Kinesis**:

#     resource "aws_kinesis_stream" "data_stream" {
#         name             = "data-stream"
#         shard_count      = 1
#         retention_period = 24
#     }

#     # Crea un stream de Kinesis llamado `data-stream` con 1 shard y un período de retención de 24 horas.

# # 3. **Función Lambda**:

#     resource "aws_lambda_function" "data_processor" {
#         filename         = "lambda_function_payload.zip"
#         function_name    = "data_processor"
#         role             = aws_iam_role.lambda_exec.arn
#         handler          = "index.handler"
#         runtime          = "nodejs14.x"
#         source_code_hash = filebase64sha256("lambda_function_payload.zip")

#         environment {
#             variables = {
#                 STREAM_NAME = aws_kinesis_stream.data_stream.name
#             }
#         }
#     }

#     # Crea una función Lambda llamada `data_processor` que utiliza Node.js 14.x. La función se despliega desde un archivo ZIP y tiene una variable de entorno `STREAM_NAME` con el nombre del stream de Kinesis.

# # 4. **Rol IAM para Lambda**:

#     resource "aws_iam_role" "lambda_exec" {
#         name = "lambda_exec_role"

#         assume_role_policy = jsonencode({
#             Version = "2012-10-17"
#             Statement = [
#                 {
#                     Action = "sts:AssumeRole"
#                     Effect = "Allow"
#                     Principal = {
#                         Service = "lambda.amazonaws.com"
#                     }
#                 }
#             ]
#         })
#     }

#     # Crea un rol IAM que permite a la función Lambda asumir el rol necesario para ejecutarse.

# # 5. **Adjuntar política al rol IAM**:

#     resource "aws_iam_role_policy_attachment" "lambda_policy" {
#         role       = aws_iam_role.lambda_exec.name
#         policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
#     }

# #     Adjunta la política básica de ejecución de Lambda al rol IAM.

# # 6. **Mapeo de fuente de eventos Lambda-Kinesis**:

#     resource "aws_lambda_event_source_mapping" "kinesis_trigger" {
#         event_source_arn  = aws_kinesis_stream.data_stream.arn
#         function_name     = aws_lambda_function.data_processor.arn
#         starting_position = "LATEST"
#     }

# #     Configura un mapeo de fuente de eventos para que la función Lambda se dispare con eventos del stream de Kinesis.

# # 7. **Outputs**:

#     output "kinesis_stream_name" {
#         value = aws_kinesis_stream.data_stream.name
#     }

#     output "lambda_function_name" {
#         value = aws_lambda_function.data_processor.function_name
#     }

#     # Define salidas para el nombre del stream de Kinesis y el nombre de la función Lambda.

# # Tu configuración ya está completa para un módulo de procesamiento en tiempo real utilizando AWS Kinesis y AWS Lambda.