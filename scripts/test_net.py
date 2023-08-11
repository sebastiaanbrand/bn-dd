import argparse
from pgmpy.readwrite import NETReader

parser = argparse.ArgumentParser(description='Test HUGIN (NET) file by reading it.')
parser.add_argument('filepath', type=str, help='path to .net BN file.')


def test_net(filepath):
    """
    Read NET file.
    """
    assert filepath.endswith('.net')

    reader = NETReader(filepath)
    #model = reader.get_model()


if __name__ == '__main__':
    args = parser.parse_args()
    test_net(args.filepath)
