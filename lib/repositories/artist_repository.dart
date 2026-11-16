import 'package:onmi_art_central/models/artist_model.dart';
import 'package:onmi_art_central/models/collection_model.dart';

class ArtistRepository {
  Future<List<Artist>> getFeaturedArtists() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      Artist(
        id: '1',
        name: 'Ralph Edwards',
        caption: 'Abstract patterns in nature #1',
        imageUrl: [
          'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        ],
        collection: [
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://media.istockphoto.com/id/636761588/photo/used-brushes-on-an-artists-palette-of-colorful-oil-paint.jpg?s=612x612&w=0&k=20&c=38YQxVJVWnNfvGtlb7AXMx_ItyHZMEdmWenNkWNQ91g=',
              'https://img.freepik.com/free-photo/abstract-nature-painted-with-watercolor-autumn-leaves-backdrop-generated-by-ai_188544-9806.jpg',
              'https://media.gettyimages.com/id/1304289911/photo/my-vision-of-female-face.jpg?s=170667a&w=gi&k=20&c=yioEuyzTjCRGd6bg9PkTATu7Elxh6R9iQhL6TrC1wIg=',
              'https://cdn.pixabay.com/photo/2024/05/18/15/41/teeth-8770514_640.jpg',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
               'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://media.istockphoto.com/id/636761588/photo/used-brushes-on-an-artists-palette-of-colorful-oil-paint.jpg?s=612x612&w=0&k=20&c=38YQxVJVWnNfvGtlb7AXMx_ItyHZMEdmWenNkWNQ91g=',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 234,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 156,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 189,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 312,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 245,
          ),
          CollectionModel(
            collectionImagesUrls: [],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 278,
          ),
        ],
      ),
      Artist(
        id: '2',
        name: 'Jenny Wilson',
        caption:
            'Abstract Expressionism - A journey through color and emotion, my artwork represents the intersection of conscious thought and subconscious expression. Each piece is a meditation on human experience, exploring themes of identity, memory, and emotional resonance. Through bold brushstrokes and dynamic color relationships, I create multilayered compositions that invite viewers to discover new details with each viewing. My process involves both intuitive mark-making and calculated composition, resulting in works that balance chaos and order.',
        imageUrl: [
          'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
        ],
        collection: [
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 432,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 289,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 367,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 298,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 445,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Oil On Wood, Animals - A unique perspective on wildlife and nature through traditional oil painting techniques combined with contemporary artistic vision. Specializing in capturing the raw essence of animal life, each piece tells a story of wilderness and freedom. My work explores the delicate balance between realism and artistic interpretation, bringing forth the soul of each subject through careful attention to detail and masterful brushwork. Through years of studying animal anatomy and behavior, I strive to create pieces that not only showcase the physical beauty of wildlife but also their spirit and character.',
            likes: 512,
          ),
        ],
      ),
      Artist(
        id: '3',
        name: 'Guy Hawkins',
        caption: 'Wildlife series #1',
        imageUrl: [
          'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
        ],
        collection: [
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1581337834467-9fac8d4b1e51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1581337834467-9fac8d4b1e51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 567,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 342,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 421,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1581337834467-9fac8d4b1e51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1581337834467-9fac8d4b1e51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 389,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 476,
          ),
          CollectionModel(
            collectionImagesUrls: [
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
              'https://images.unsplash.com/photo-1547891654-e66ed7ebb968?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ],
            description:
                'Contemporary Mixed Media - Pushing the boundaries of traditional art forms through innovative combinations of materials and techniques. My work challenges conventional artistic boundaries by incorporating diverse elements such as digital media, found objects, and classical painting methods. Each piece is an exploration of texture, dimension, and narrative, creating immersive experiences that engage viewers on multiple sensory levels. Drawing inspiration from urban landscapes and digital culture, I create pieces that reflect the complexity of modern life while maintaining a connection to artistic tradition.',
            likes: 534,
          ),
        ],
      ),
    ];
  }
}
