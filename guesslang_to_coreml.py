#!/usr/bin/env python3

import coremltools as ct 
import tensorflow as tf

# Load from .h5 file
# tf_model = tf.saved_model.load("guesslang/guesslang/data/model/")

# Convert to Core ML
model = ct.convert("guesslang/guesslang/data/model/", source ="tensorflow")

