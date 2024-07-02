#!/usr/bin/python3
import click
import subprocess
import os
import shutil

SOURCE_PATH = os.getenv("BP_PROJ_PATH")
BUILD_PATH = os.path.join(SOURCE_PATH, "build")
TEST_PATH = os.path.join(BUILD_PATH, "tests")


def cleanall():
    if os.path.exists(BUILD_PATH):
        shutil.rmtree(BUILD_PATH)


@click.group(chain=True)
def cli():
    pass


@click.command(help="Build the application")
@click.option("--clean", is_flag=True, default=False, help="Clean build")
def build(clean):
    if clean:
        cleanall()
    build_result = subprocess.run(["cmake", "-S", SOURCE_PATH, "-B", BUILD_PATH])
    build_result = subprocess.run(["cmake", "--build", BUILD_PATH])


@click.command()
def run_tests():
    if not os.path.exists(BUILD_PATH):
        print(f"{BUILD_PATH} doesn't exists. Build and run `bptool.py build` first.")
    else:
        build_result = subprocess.run(["cmake", "--build", BUILD_PATH])
        test_result = subprocess.run(["ctest"], cwd=TEST_PATH)


def init_cli():
    cli.add_command(build)
    cli.add_command(run_tests)


if __name__ == "__main__":
    init_cli()
    cli()
