from pathlib import Path

def generate_list(img_dir: str, output_txt: str):
    img_dir = Path(img_dir)
    images = sorted(img_dir.glob('*.jpg'))
    with open(output_txt, 'w') as f:
        for img in images:
            f.write(str(img.relative_to(img.parent.parent.parent)) + '\n')

generate_list('./datasets/coco/images/train2017', 'train2017.txt')
generate_list('./datasets/coco/images/val2017', 'val2017.txt')
generate_list('./datasets/coco/images/test2017', 'test-dev2017.txt')
