#!/usr/bin/env python
import os
import subprocess

from build_all import conda_packages

from binstar_client.utils import get_binstar
import binstar_client


def upload_built_package(package, token, root_dir):
    package_fname = subprocess.check_output(['conda', 'build', package, '--output'],
                                            cwd=root_dir).strip()
    print('Checking for package {} whether the distribution {} '
          'exists.'.format(package, package_fname))

    # Figure out if this package has already been uploaded.
    binstar = get_binstar()
    try:
        package_info = binstar.package('pelson', package)
    except binstar_client.errors.NotFound:
        package_exists = False
    else:
        package_exists = True

    base_package_fname = os.path.basename(package_fname)
    package_os = os.path.basename(os.path.dirname(package_fname))
    upload_name = '{}/{}'.format(package_os, base_package_fname)

    if package_exists:
        exists = False
        for release in package_info['releases']:
            if upload_name in release['distributions']:
                exists = True
                break

    if not package_exists or not exists:
        print('Uploading {} to binstar:'.format(package))
        try:
            subprocess.check_call(['binstar', '-t', token, 'upload', package_fname],
                                  cwd=root_dir)
        except:
            raise RuntimeError('EXCEPTION OCCURED. Exception hidden to prevent token leakage.')
    else:
        print('\n' + '\n'.join(['!' * 80] * 2))
        print("NOT UPLOADING {}'s DISTRIBUTION {} AS IT ALREADY EXISTS ON "
              "BINSTAR.".format(package, upload_name))
        print('!' * 80)



def main():
    # Look in ../../ from this script.
    conda_recipes_root = os.path.dirname(os.path.dirname(
                                os.path.dirname(os.path.abspath(__file__))))
    for package, directory, yaml in conda_packages(conda_recipes_root):
        upload_built_package(package, os.environ['BINSTAR_TOKEN'], conda_recipes_root)


if __name__ == '__main__':
    main()