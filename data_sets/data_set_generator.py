#!/usr/bin/python

import os
import random
import shutil
import uuid
import Image

__author__ = 'budde'

train_ratio = 0.8
image_dir = ["graphs", "graphs2"]
out_dir = "out"
size = 30

def generate_sets_from_dir_and_ratio(path, ratio):
    sets = ([], [])
    for f in os.listdir(path):
        p = path + "/" + f
        if not os.path.isfile(p):
            break
        r = random.random()
        sets[0 if r <= ratio else 1].append(p)
    return sets


def copy_file_path_set(dir_path, path_set):
    create_if_not_exists(dir_path)
    target_paths = []
    for file_path in path_set:
        _, ext = os.path.splitext(file_path)
        file_name = str(uuid.uuid4()) + ext
        p = dir_path + "/" + file_name
        shutil.copyfile(file_path, p)
        target_paths.append(p)
    return target_paths


def create_if_not_exists(path):
    if not os.path.exists(path):
        os.mkdir(path)


def copy_set(dir_path, dir_name, path_sets):
    create_if_not_exists(dir_path)
    train_dir = dir_path + "/train/"
    create_if_not_exists(train_dir)
    test_dir = dir_path + "/test/"
    create_if_not_exists(test_dir)
    return (
        copy_file_path_set(train_dir + dir_name, path_sets[0]), copy_file_path_set(test_dir + dir_name, path_sets[1]))


def generate_and_copy(dir_path, out_dir_path, dir_name, ratio):
    s = generate_sets_from_dir_and_ratio(dir_path + "/" + dir_name, ratio)
    return copy_set(out_dir_path, dir_name, s)


def resize_image(image_path, width=30, height=30, method=Image.ANTIALIAS):
    img = Image.open(image_path)
    new_img = img.resize((width, height), method)
    new_img.save(image_path)


def resize_images(file_paths):
    for p in file_paths:
        resize_image(p, size, size)


def generate_and_copy_for_dirs(image_dirs, output_dir, ratio):
    result = ([], [])
    for d in image_dirs:
        (train1, test1) = generate_and_copy(d, output_dir, "n", ratio)
        (train2, test2) = generate_and_copy(d, output_dir, "nn", ratio)
        result = result[0]+train1+train2, result[1]+test1+test2
    return result


if __name__ == "__main__":

    if os.path.exists(out_dir):
        shutil.rmtree(out_dir)

    (train, test) = generate_and_copy_for_dirs(image_dir, out_dir, train_ratio)
    resize_images(train+test)


