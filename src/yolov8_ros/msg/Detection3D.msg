# Detection3D.msg
std_msgs/Header header
string class_name
float32 confidence
float32[] bbox  # [x_min, y_min, x_max, y_max]
float32[] position  # [x, y, z] (3D position, optional)
