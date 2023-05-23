import argparse
from pgmpy.readwrite import XMLBIFReader, NETWriter

parser = argparse.ArgumentParser(description='Convert XMLBIF format to HUBIN (NET) format.')
parser.add_argument('filepath', type=str, help='path to .xmlbif BN file.')


def convert(filepath):
    """
    Read XMLBIF file and write NET file to the same folder.
    """
    assert filepath[-7:] == '.xmlbif'

    reader = XMLBIFReader(filepath)
    model = reader.get_model()
    writer = NETWriter(model)
    writer.write_net(filepath[:-7] + '.net')


if __name__ == '__main__':
    args = parser.parse_args()
    convert(args.filepath)
